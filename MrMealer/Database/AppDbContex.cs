using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MrMealer.Models;

namespace MrMealer.Database
{
    public class AppDbContext : DbContext
    {
        private string _dbPath;

        public DbSet<Recipe> Recipes { get; set; }
        public DbSet<Ingredient> Ingredients { get; set; }
        public DbSet<Meal> Meals { get; set; }
        public DbSet<Day> Days { get; set; }
        public DbSet<RecipeForMeal> RecipeForMeals { get; set; }


        public AppDbContext()
        {
            _dbPath = Path.Combine(FileSystem.AppDataDirectory, "recipes.db");
            Database.Migrate();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite($"Filename={_dbPath}");
    }

}
