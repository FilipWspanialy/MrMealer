using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Database.Models
{
    public class Meal : INotifyPropertyChanged
    {
        [Key]

        public int Id { get; set; }
        public string Name { get; set; }
        public List<RecipeForMeal>? Recipes { get; set; }
        public int DayId { get; set; }
        public Day Day { get; set; }

        private Recipe? _selectedRecipe;

        [NotMapped]
        public Recipe? SelectedRecipe
        {
            get => _selectedRecipe;
            set
            {
                if (_selectedRecipe != value)
                {
                    _selectedRecipe = value;
                    OnPropertyChanged(nameof(SelectedRecipe));
                }
            }
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
