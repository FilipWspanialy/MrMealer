using Microsoft.EntityFrameworkCore;
using MrMealer.Database;
using MrMealer.Database.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace MrMealer.ViewModels
{
    public class ShoppingListViewModel : INotifyPropertyChanged
    {
        private readonly AppDbContext _db;

        public ObservableCollection<Ingredient> Ingredients { get; set; } = new();

        public ShoppingListViewModel()
        {
            _db = new AppDbContext();
            LoadIngredients();
        }

        public async Task LoadIngredients()
        {
            var ingredients = await _db.RecipeForMeals
                .Include(rfm => rfm.Recipe)
                    .ThenInclude(r => r.Ingredients)
                .SelectMany(rfm => rfm.Recipe.Ingredients)
                .ToListAsync();

            var uniqueIngredients = ingredients
                .GroupBy(i => i.Name.Trim().ToLower())
                .Select(g => g.First())
                .ToList();

            Ingredients.Clear();
            Ingredients = new ObservableCollection<Ingredient>(uniqueIngredients);

            foreach (var ingredient in Ingredients)
            {
                ingredient.PropertyChanged += async (s, e) =>
                {
                    if (e.PropertyName == nameof(Ingredient.Isbought))
                    {
                        await UpdateIngredientAsync(ingredient);
                    }
                };
            }

            OnPropertyChanged(nameof(Ingredients));
        }

        private async Task UpdateIngredientAsync(Ingredient ingredient)
        {
            _db.Ingredients.Update(ingredient);
            await _db.SaveChangesAsync();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string name = null)
            => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
    }
}
