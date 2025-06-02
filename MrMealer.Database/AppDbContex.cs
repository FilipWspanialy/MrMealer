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
        public DbSet<IngredientFromApi> IngredientsfromApi { get; set; }

        public AppDbContext()
        {
            _dbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "recipes.db");
            Console.WriteLine(_dbPath);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite($"Filename={_dbPath}");

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Recipe>()
                .HasKey(r => r.Id);
            modelBuilder.Entity<Ingredient>()
                .HasKey(i => i.Id);

            modelBuilder.Entity<Ingredient>()
                .HasOne(i => i.Recipe)
                .WithMany(r => r.Ingredients)
                .HasForeignKey(i => i.RecipeId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Meal>()
                .HasKey(m => m.Id);
            modelBuilder.Entity<Day>()
                .HasKey(d => d.Id);

            modelBuilder.Entity<Meal>()
                .HasOne(m => m.Day)
                .WithMany(d => d.Meals)
                .HasForeignKey(m => m.DayId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<RecipeForMeal>()
                .HasKey(rm => rm.Id);

            modelBuilder.Entity<RecipeForMeal>()
                .HasOne(rm => rm.Recipe)
                .WithMany()
                .HasForeignKey(rm => rm.RecipeId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<RecipeForMeal>()
                .HasOne(rm => rm.Meal)
                .WithMany(m => m.Recipes)
                .HasForeignKey(rm => rm.MealId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<IngredientFromApi>()
                .ToTable("IngredientsfromApi")
                .HasKey(i => i.Id);

            base.OnModelCreating(modelBuilder);
        }
    }
}
