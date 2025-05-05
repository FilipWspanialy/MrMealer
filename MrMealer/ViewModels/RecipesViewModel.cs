using System.Collections.ObjectModel;
using System.Threading.Tasks;
using MrMealer.Models;

public class RecipesViewModel
{
    public ObservableCollection<Recipe> Recipes { get; set; } = new ObservableCollection<Recipe>();
    private readonly ApiService _apiService = new ApiService();

    public RecipesViewModel()
    {
        LoadRecipes();
    }

    private async void LoadRecipes()
    {
        var recipes = await ApiService.GetRecipesAsync();
        foreach (var recipe in recipes)
        {
            Recipes.Add(recipe);
        }
    }
}
