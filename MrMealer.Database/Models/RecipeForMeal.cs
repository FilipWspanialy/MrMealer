using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Database.Models
{
    public class RecipeForMeal
    {
        [Key]
        public int Id { get; set; }
        public int MealId { get; set; }
        public Meal Meal { get; set; }
        public int RecipeId { get; set; }
        public Recipe Recipe { get; set; }
        public string RecipeName { get; set; }
        public List<Ingredient> Ingredients { get; set; } = new();
    }
}
