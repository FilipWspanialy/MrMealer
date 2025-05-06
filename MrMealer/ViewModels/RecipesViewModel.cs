using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MrMealer.Database;
using MrMealer.Models;

public class RecipesViewModel
{
    public ObservableCollection<Recipe> Recipes { get; set; } = new ObservableCollection<Recipe>();

    public RecipesViewModel()
    {

    }

    public async Task LoadRecipes()
    {
        try
        {
            Recipes.Clear();
            var db = new AppDbContext();
            var recipes = await db.Recipes.ToListAsync(); 
            foreach (var recipe in recipes)
            {
                Recipes.Add(recipe);
            }
        }
        catch (Exception ex)
        {
        
        }
    }
}
