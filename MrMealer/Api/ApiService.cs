using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using MrMealer.Models;

public class ApiService
{
    private static readonly HttpClient _client = new HttpClient();

    public static async Task<List<Recipe>> GetRecipesAsync(string query)
    {
        var url = $"https://www.themealdb.com/api/json/v1/1/search.php?s={query}";
        var json = await _client.GetStringAsync(url);

        var data = JsonConvert.DeserializeObject<ApiResponse>(json);

        return data.Meals?.Select(m => new Recipe
        {
            Id = m.IdMeal,
            Name = m.StrMeal,
            Instructions = m.StrInstructions,
            ImageUrl = m.StrMealThumb,
            Ingredients = m.GetIngredients()
        }).ToList() ?? new();
    }
}




