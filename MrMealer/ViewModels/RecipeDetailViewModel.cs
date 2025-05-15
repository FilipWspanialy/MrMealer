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

namespace MrMealer.ViewModels
{
    [QueryProperty(nameof(RecipeId), "recipeId")]
    public class RecipeDetailsViewModel : INotifyPropertyChanged
    {
        private readonly AppDbContext _db;
        public RecipeDetailsViewModel()
        {
            _db = new AppDbContext();
        }
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
    }
}
