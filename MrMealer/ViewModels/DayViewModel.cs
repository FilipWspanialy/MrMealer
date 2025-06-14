using Microsoft.EntityFrameworkCore;
using MrMealer.Database;
using MrMealer.Database.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace MrMealer.ViewModels;

[QueryProperty(nameof(DayId), "dayId")]
public class DayViewModel : INotifyPropertyChanged
{
    private readonly AppDbContext _db;
    public ObservableCollection<Meal> Meals { get; set; } = new();
    public ObservableCollection<Recipe> Recipes { get; set; } = new();

    public int DayId { get; set; }

    public ICommand SaveMealsCommand { get; }

    public DayViewModel()
    {
        _db = new AppDbContext();
        SaveMealsCommand = new Command(async () => await SaveMealsAsync());
    }

    public async Task LoadDataAsync()
    {
        var recipes = await _db.Recipes.ToListAsync();
        Recipes = new ObservableCollection<Recipe>(recipes);
        OnPropertyChanged(nameof(Recipes));

        var meals = await _db.Meals
            .Include(m => m.Recipes)
            .ThenInclude(rfm => rfm.Recipe)
            .Where(m => m.DayId == DayId)
            .ToListAsync();

        foreach (var meal in meals)
        {
            var recipeId = meal.Recipes.FirstOrDefault()?.RecipeId;
            meal.SelectedRecipe = Recipes.FirstOrDefault(r => r.Id == recipeId);
        }

        Meals = new ObservableCollection<Meal>(meals);
        OnPropertyChanged(nameof(Meals));
    }

    private async Task SaveMealsAsync()
    {
        foreach (var meal in Meals)
        {
            var existingLinks = await _db.RecipeForMeals.Where(rfm => rfm.MealId == meal.Id).ToListAsync();
            _db.RecipeForMeals.RemoveRange(existingLinks);

            if (meal.SelectedRecipe != null)
            {
                _db.RecipeForMeals.Add(new RecipeForMeal
                {
                    MealId = meal.Id,
                    RecipeId = meal.SelectedRecipe.Id,
                    RecipeName = meal.SelectedRecipe.Name
                });
            }
        }

        await _db.SaveChangesAsync();
        await Application.Current.MainPage.DisplayAlert("Saved", "Recipes assigned to meals successfully.", "OK");
        await Shell.Current.GoToAsync("..");
    }

    public event PropertyChangedEventHandler PropertyChanged;
    private void OnPropertyChanged([CallerMemberName] string name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}
