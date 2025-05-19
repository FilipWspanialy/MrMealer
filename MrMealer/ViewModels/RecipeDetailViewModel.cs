using Microsoft.EntityFrameworkCore;
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
                OnPropertyChanged();
            }
        }
        public ObservableCollection<Ingredient> Ingredients { get; set; }
        public RecipeDetailsViewModel()
        {
            _db = new AppDbContext();
            EditCommand = new Command(OnEdit, CanEdit);
            DeleteCommand = new Command(OnDelete, CanEdit);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string name = "") =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        private void LoadRecipe()
        {
            Recipe = _db.Recipes
                .Include(r => r.Ingredients)
                .FirstOrDefault(r => r.Id == RecipeId);
            Ingredients = new ObservableCollection<Ingredient>(Recipe.Ingredients);
            OnPropertyChanged(nameof(Ingredients));
        }
        public void Refresh()
        {
            LoadRecipe();
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
