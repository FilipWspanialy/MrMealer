using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using MrMealer.Models;

public class ApiService
{
    private static readonly HttpClient _client = new HttpClient();

    public static async Task<List<Recipe>> GetRecipesAsync()
    {
        string url = "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"; 
        var response = await _client.GetStringAsync(url);
        var data = JsonConvert.DeserializeObject<ApiResponse>(response);
        return data.Recipes;
    }
}




