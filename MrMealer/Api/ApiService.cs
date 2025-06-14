using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using MrMealer.Database;
using MrMealer.Database.Models;

public class ApiService
{
    private static readonly HttpClient _client = new HttpClient();

    public static async Task GetAsync(string query)
    {
        var url = $"https://www.themealdb.com/api/json/v1/1/search.php?s={query}";
        var json = await _client.GetStringAsync(url);
        var data = JsonConvert.DeserializeObject<ApiResponse>(json);
        var url1 = "https://www.themealdb.com/api/json/v1/1/list.php?i=list";
        var json1 = await _client.GetStringAsync(url1);
        var data1 = JsonConvert.DeserializeObject<ApiResponseIngre>(json1);


        var recipes = data.Meals.Select(m => new Recipe
        {
            Name = m.StrMeal,
            Instructions = m.StrInstructions,
            ImageUrl = m.StrMealThumb,
            Ingredients = m.GetIngredients()
        }).ToList();

        var ingres = data1.Meals.Select(m => new IngredientFromApi
        {
            Name = m.StrIngredient
        }).ToList();

        using (var db = new AppDbContext())
        {
            //db.Recipes.RemoveRange(db.Recipes.Where(x => x.IsUserCreated == false));
            //db.IngredientsFromApi.RemoveRange(db.IngredientsFromApi);
            //await db.SaveChangesAsync();
            if (!db.Recipes.Any())
            {
                foreach (var recipe in recipes)
                {
                    var exists = db.Recipes.Any(r => r.Name == recipe.Name);

                    if (!exists)
                    {
                        db.Recipes.Add(recipe);
                    }
                }
            }
            if (!db.IngredientsFromApi.Any())
            {
                foreach (var ingredient in ingres)
                {
                    db.IngredientsFromApi.Add(ingredient);
                }
            }
            await db.SaveChangesAsync();
        }
    }

}




