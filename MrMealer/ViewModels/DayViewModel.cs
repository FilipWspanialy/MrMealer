using Microsoft.EntityFrameworkCore;
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
    [QueryProperty(nameof(Id), "dayId")]
    public class DayViewModel
    {
        private readonly AppDbContext _db;
        public ObservableCollection<Meal> Meals { get; } = new();
        public ObservableCollection<Recipe> Recipes { get; } = new();
        public ObservableCollection<RecipeForMeal> RecipesForMeal { get; } = new();
        private int _id;
        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                LoadMeals();
                LoadRecipes();
            }
        }
        public DayViewModel()
        {
            _db = new AppDbContext();
        }
        private void LoadRecipes()
        {
            Recipes.Clear();
            foreach (var recipe in _db.Recipes.ToList())
            {
                Recipes.Add(recipe);
            }
        }
        private void LoadMeals()
        {
            Meals.Clear();
            var meals = _db.Meals
                .Include(m => m.Recipes)
                .Where(x => x.DayId == Id)
                .ToList();

            foreach (var meal in meals)
            {
                Meals.Add(meal);
            }
        }
        public void AddRecipeToMeal(int mealId, int recipeId)
        {
            var recipeForMeal = new RecipeForMeal
            {
                MealId = mealId,
                RecipeId = recipeId,
                RecipeName = _db.Recipes.Where(x=>x.Id == recipeId).GetType().Name
            };

            _db.RecipeForMeals.Add(recipeForMeal);
            _db.SaveChanges();

        }

    }
}
