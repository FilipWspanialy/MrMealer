using Microsoft.EntityFrameworkCore;
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

    [QueryProperty(nameof(RecipeId), "recipeId")]
    public class RecipeDetailsViewModel : INotifyPropertyChanged
    {
        private readonly AppDbContext _db;
        public ICommand EditCommand { get; }
        public ICommand DeleteCommand { get; }
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
                }
            }
        }
        public Recipe Recipe
        {
            get => recipe;
            set
            {
                recipe = value;
                OnPropertyChanged();
            }
        }
        public ObservableCollection<Ingredient> Ingredients { get; set; }
        public RecipeDetailsViewModel()
        {
            _db = new AppDbContext();
            Ingredients = new ObservableCollection<Ingredient>();
            EditCommand = new Command(OnEdit, CanEdit);
            DeleteCommand = new Command(OnDelete, CanEdit);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string name = "") =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        public async Task LoadRecipe()
        {
            using var db = new AppDbContext();

            var loadedRecipe = await db.Recipes
                .Include(r => r.Ingredients)
                .FirstOrDefaultAsync(r => r.Id == RecipeId);

            if (loadedRecipe != null)
            {
                Recipe = loadedRecipe;

                Ingredients.Clear();
                foreach (var i in Recipe.Ingredients)
                    Ingredients.Add(i);

                OnPropertyChanged(nameof(Ingredients));
            }
        }


        private bool CanEdit()
        {
            return Recipe?.IsUserCreated == true;
        }
        private async void OnEdit()
        {
            await Shell.Current.GoToAsync($"recipeEdit?recipeId={Recipe.Id}");
        }
        private async void OnDelete()
        {
            bool confirm = await Application.Current.MainPage.DisplayAlert(
                "Confirmation",
                "Are you sure to delete?",
                "Yes", "No");

            if (confirm)
            {
                _db.Remove(Recipe);
                _db.SaveChangesAsync();
                await Shell.Current.GoToAsync("..");
            }
        }
    }
}
