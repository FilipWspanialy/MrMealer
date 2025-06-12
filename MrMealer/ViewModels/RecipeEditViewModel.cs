using MrMealer.Database.Models;
using MrMealer.Database;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using MrMealer.ViewModels;

[QueryProperty(nameof(RecipeId), "recipeId")]
public class RecipeEditViewModel : INotifyPropertyChanged
{
    private readonly AppDbContext _db;

    public ObservableCollection<IngredientFromApi> AvailableIngredients { get; set; } = new();
    public ObservableCollection<IngredientViewModel> Ingredients { get; set; } = new();

    private string recipeName;
    public string RecipeName
    {
        get => recipeName;
        set
        {
            recipeName = value;
            OnPropertyChanged();
        }
    }

    private string instructions;
    public string Instructions
    {
        get => instructions;
        set
        {
            instructions = value;
            OnPropertyChanged();
        }
    }

    public int RecipeId { get; set; }

    public ICommand AddIngredientCommand { get; }
    public ICommand SaveChangesCommand { get; }

    public RecipeEditViewModel()
    {
        _db = new AppDbContext();
        AddIngredientCommand = new Command(AddIngredient);
        SaveChangesCommand = new Command(async () => await SaveChangesAsync());
    }

    public event PropertyChangedEventHandler PropertyChanged;
    private void OnPropertyChanged([CallerMemberName] string name = "") =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));

    public async Task LoadDataAsync(int recipeId)
    {
        RecipeId = recipeId;

        var all = await _db.IngredientsFromApi.ToListAsync();
        AvailableIngredients = new ObservableCollection<IngredientFromApi>(all);
        OnPropertyChanged(nameof(AvailableIngredients));

        var r = await _db.Recipes
            .Include(r => r.Ingredients)
            .FirstOrDefaultAsync(r => r.Id == recipeId);

        if (r != null)
        {
            RecipeName = r.Name;
            Instructions = r.Instructions;

            Ingredients = new ObservableCollection<IngredientViewModel>(
                r.Ingredients.Select(i =>
                {
                    var selected = AvailableIngredients.FirstOrDefault(a => a.Name == i.Name);
                    return new IngredientViewModel(RemoveIngredient)
                    {
                        SelectedIngredient = selected,
                        Measure = i.Measure
                    };
                })
            );

            OnPropertyChanged(nameof(Ingredients));
        }
    }

    private void AddIngredient()
    {
        Ingredients.Add(new IngredientViewModel(RemoveIngredient));
        OnPropertyChanged(nameof(Ingredients));
    }

    private async Task SaveChangesAsync()
    {
        if (string.IsNullOrWhiteSpace(RecipeName) || Ingredients.All(i => i.SelectedIngredient == null))
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Please fill out recipe name and at least one ingredient.", "OK");
            return;
        }

        var recipeToUpdate = await _db.Recipes.Include(r => r.Ingredients).FirstOrDefaultAsync(r => r.Id == RecipeId);
        if (recipeToUpdate == null)
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Recipe not found.", "OK");
            return;
        }

        recipeToUpdate.Name = RecipeName;
        recipeToUpdate.Instructions = Instructions;
        _db.Ingredients.RemoveRange(recipeToUpdate.Ingredients);

        recipeToUpdate.Ingredients = Ingredients
            .Where(i => i.SelectedIngredient != null)
            .Select(i => new Ingredient
            {
                Name = i.SelectedIngredient.Name,
                Measure = i.Measure
            })
            .ToList();

        await _db.SaveChangesAsync();
        await Application.Current.MainPage.DisplayAlert("Success", "Recipe updated!", "OK");
        await Shell.Current.GoToAsync("..");
    }
    private void RemoveIngredient(IngredientViewModel ingredient)
    {
        Ingredients.Remove(ingredient);
    }


}
