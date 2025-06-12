using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MrMealer.Database;
using MrMealer.Database.Models;

public class RecipesViewModel : INotifyPropertyChanged
{
    public ObservableCollection<Recipe> Recipes { get; } = new();

    public RecipesViewModel()
    {
    }

    public async Task LoadRecipesAsync()
    {
        using var db = new AppDbContext();

        var recipesFromDb = await db.Recipes.OrderBy(r => r.Id).ToListAsync();

        Recipes.Clear();
        foreach (var recipe in recipesFromDb)
        {
            Recipes.Add(recipe);
        }

        OnPropertyChanged(nameof(Recipes));
    }

    public event PropertyChangedEventHandler PropertyChanged;
    private void OnPropertyChanged([CallerMemberName] string propertyName = "")
        => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
}
