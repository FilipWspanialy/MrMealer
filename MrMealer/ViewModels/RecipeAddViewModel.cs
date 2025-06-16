using MrMealer.Database;
using MrMealer.Database.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MrMealer.ViewModels
{
    public class RecipeAddViewModel : BindableObject
    {
        private string _recipeName;
        private string _instructions;
        public string RecipeName
        {
            get => _recipeName;
            set
            {
                _recipeName = value;
                OnPropertyChanged();
            }
        }
        public string Instructions
        {
            get => _instructions;
            set
            {
                _instructions = value;
                OnPropertyChanged();
            }
        }
        public ObservableCollection<IngredientFromApi> AvailableIngredients { get; set; } = new();
        public ObservableCollection<IngredientViewModel> Ingredients { get; set; } = new();
        public ICommand AddIngredientCommand { get; }
        public ICommand SaveRecipeCommand { get; }
        public RecipeAddViewModel()
        {
            AddIngredientCommand = new Command(AddIngredient);
            SaveRecipeCommand = new Command(async () => await SaveRecipeAsync());
            LoadAvailableIngredients();
        }

        private void LoadAvailableIngredients()
        {
            using var db = new AppDbContext();
            var ingredientsFromDb = db.IngredientsFromApi.ToList();
            AvailableIngredients = new ObservableCollection<IngredientFromApi>(ingredientsFromDb);
        }

        private void AddIngredient()
        {

            Ingredients.Add(new IngredientViewModel(RemoveIngredient));
        }

        private async Task SaveRecipeAsync()
        {
            if (string.IsNullOrWhiteSpace(RecipeName))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Recipe name is required.", "OK");
                return;
            }

            if (string.IsNullOrWhiteSpace(Instructions))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Instructions are required.", "OK");
                return;
            }

            var validIngredients = Ingredients
                .Where(i => i.SelectedIngredient != null && !string.IsNullOrWhiteSpace(i.Measure))
                .Select(i => new Ingredient
                {
                    Name = i.SelectedIngredient.Name,
                    Measure = i.Measure
                }).ToList();

            if (string.IsNullOrWhiteSpace(RecipeName) || validIngredients.Count == 0)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please fill out recipe name and at least one ingredient.", "OK");
                return;
            }

            var recipe = new Recipe
            {
                Name = RecipeName,
                Instructions = Instructions,
                Ingredients = validIngredients,
                IsUserCreated = true
            };

            using var db = new AppDbContext();
            db.Recipes.Add(recipe);
            await db.SaveChangesAsync();

            await Application.Current.MainPage.DisplayAlert("Success", "Recipe saved!", "OK");

            RecipeName = string.Empty;
            Instructions = string.Empty;
            Ingredients.Clear();

            await Shell.Current.GoToAsync("..");
        }
        private void RemoveIngredient(IngredientViewModel ingredient)
        {
            Ingredients.Remove(ingredient);
        }


    }
}
