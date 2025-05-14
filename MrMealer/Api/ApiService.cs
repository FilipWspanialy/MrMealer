using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using MrMealer.Models;
using MrMealer.Database;

public class ApiService
{
    private static readonly HttpClient _client = new HttpClient();

    public static async Task<List<Recipe>> GetRecipesAsync(string query)
    {
        var url = $"https://www.themealdb.com/api/json/v1/1/search.php?s={query}";
        var json = await _client.GetStringAsync(url);
        var data = JsonConvert.DeserializeObject<ApiResponse>(json);

        if (data.Meals == null)
            return new();

        var recipes = data.Meals.Select(m => new Recipe
        {
            Name = m.StrMeal,
            Instructions = m.StrInstructions,
            ImageUrl = m.StrMealThumb,
            Ingredients = m.GetIngredients()
        }).ToList();

        using (var db = new AppDbContext())
        {
            db.Recipes.RemoveRange(db.Recipes.Where(x=>x.IsUserCreated == false));
            await db.SaveChangesAsync();
            foreach (var recipe in recipes)
            {
                // Sprawdź, czy przepis już istnieje w bazie
                var exists = db.Recipes.Any(r => r.Name == recipe.Name);

                if (!exists)
                {
                    db.Recipes.Add(recipe);
                }
            }

            await db.SaveChangesAsync();
        }

        return recipes;
    }

}




