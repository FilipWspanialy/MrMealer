using MrMealer.Database;
using MrMealer.Models;
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
        public ObservableCollection<Ingredient> Ingredients { get; set; } = new();
        public ICommand AddIngredientCommand { get; }
        public ICommand SaveRecipeCommand { get; }
        public RecipeAddViewModel()
        {
            AddIngredientCommand = new Command(AddIngredient);
            SaveRecipeCommand = new Command(async () => await SaveRecipeAsync());
        }
        private void AddIngredient()
        {

            Ingredients.Add(new Ingredient());
        }
        private async Task SaveRecipeAsync()
        {
            var validIngredients = Ingredients.Where(i => !string.IsNullOrWhiteSpace(i.Name)).ToList();

            if (string.IsNullOrWhiteSpace(RecipeName) || validIngredients.Count == 0)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please fill out recipe name and at least one ingredient.", "OK");
                return;
            }

            var recipe = new Recipe
            {
                Name = RecipeName,
                Instructions = Instructions,
                Ingredients = validIngredients.ToList(),
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
    }
}
