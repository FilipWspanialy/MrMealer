using MrMealer.Database;
using MrMealer.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MrMealer.ViewModels
{
    public class TestVM
    {
        private readonly AppDbContext _db;

        public ObservableCollection<Recipe> Recipes { get; } = new();

        public TestVM()
        {
            _db = new AppDbContext();

            LoadRecipes();
        }

        private void LoadRecipes()
        {
            Recipes.Clear();
            foreach (var recipe in _db.Recipes.ToList())
                Recipes.Add(recipe);
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}

