using Microsoft.EntityFrameworkCore;
using MrMealer.Database;
using MrMealer.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace MrMealer.ViewModels
{
    [QueryProperty(nameof(RecipeId), "recipeId")]
    public class RecipeEditViewModel : INotifyPropertyChanged
    {
        private readonly AppDbContext _db;
        private int recipeId;
        private Recipe recipe;
        public int RecipeId
        {
            get => recipeId;
            set
            {
                if (recipeId != value)
                {
                    recipeId = value;
                    LoadRecipe();
                }
            }
        }
        public Recipe Recipe
        {
            get => recipe;
            set
            {
                recipe = value;
                RecipeName = recipe?.Name;
                Instructions = recipe?.Instructions;
                Ingredients = new ObservableCollection<Ingredient>(recipe?.Ingredients ?? new());
                OnPropertyChanged();
                OnPropertyChanged(nameof(Ingredients));
            }
        }
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
        public ObservableCollection<Ingredient> Ingredients { get; set; } = new();
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
        public void LoadRecipe()
        {
            Recipe = _db.Recipes
                .Include(r => r.Ingredients)
                .FirstOrDefault(r => r.Id == RecipeId);
        }
        private void AddIngredient()
        {
            Ingredients.Add(new Ingredient());
            OnPropertyChanged(nameof(Ingredients));
        }
        private async Task SaveChangesAsync()
        {
            if (string.IsNullOrWhiteSpace(RecipeName) || Ingredients.All(i => string.IsNullOrWhiteSpace(i.Name)))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please fill out recipe name and at least one ingredient.", "OK");
                return;
            }

            var recipeToUpdate = _db.Recipes.Include(r => r.Ingredients).FirstOrDefault(r => r.Id == RecipeId);
            if (recipeToUpdate == null)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Recipe not found.", "OK");
                return;
            }

            recipeToUpdate.Name = RecipeName;
            recipeToUpdate.Instructions = Instructions;
            _db.Ingredients.RemoveRange(recipeToUpdate.Ingredients);
            recipeToUpdate.Ingredients = Ingredients
                .Where(i => !string.IsNullOrWhiteSpace(i.Name))
                .ToList();

            await _db.SaveChangesAsync();
            await Application.Current.MainPage.DisplayAlert("Success", "Recipe updated!", "OK");
            await Shell.Current.GoToAsync("..");
        }

    }
}
