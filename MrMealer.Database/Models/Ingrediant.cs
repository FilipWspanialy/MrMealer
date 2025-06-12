using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Database.Models
{
    public class Ingredient : INotifyPropertyChanged
    {
        private string _name;
        private string _measure;
        private int _recipeId;
        private bool _isbought = false;

        [Key]
        public int Id { get; set; }
        public bool Isbought
        {
            get => _isbought;
            set
            {
                if (_isbought != value)
                {
                    _isbought = value;
                    OnPropertyChanged();
                }
            }
        }
        public string Name
        {
            get => _name;
            set
            {
                if (_name != value)
                {
                    _name = value;
                    OnPropertyChanged();
                }
            }
        }

        public string? Measure
        {
            get => _measure;
            set
            {
                if (_measure != value)
                {
                    _measure = value;
                    OnPropertyChanged();
                }
            }
        }

        public int RecipeId
        {
            get => _recipeId;
            set
            {
                if (_recipeId != value)
                {
                    _recipeId = value;
                    OnPropertyChanged();
                }
            }
        }
        public Recipe Recipe { get; set; }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
