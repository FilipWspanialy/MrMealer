using MrMealer.Database;
using MrMealer.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.ViewModels
{
    public class MyRecipesViewModel
    {
        public ObservableCollection<Recipe> Recipes { get; set; } = new ObservableCollection<Recipe>();
        public MyRecipesViewModel()
        {
            LoadRecipes();
        }

        private async void LoadRecipes()
        {
            Recipes.Clear();
            
            var db = new AppDbContext(); 
            var recipes = db.Recipes.ToList();
            foreach (var recipe in recipes)
            {
                Recipes.Add(recipe);
            }
        }
    }
}
