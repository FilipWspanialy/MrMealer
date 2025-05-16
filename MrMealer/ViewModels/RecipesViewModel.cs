using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Threading.Tasks;
using MrMealer.Database;
using MrMealer.Models;

public class RecipesViewModel
{
    private readonly AppDbContext _db;

    public ObservableCollection<Recipe> Recipes { get; } = new();

    public RecipesViewModel()
    {
        _db = new AppDbContext();

        LoadRecipesAsync();
    }

    public async Task LoadRecipesAsync()
    {
        Recipes.Clear();
        foreach (var recipe in _db.Recipes.OrderBy(r => r.Id).ToList())
            Recipes.Add(recipe);
    }

    public event PropertyChangedEventHandler PropertyChanged;

}
