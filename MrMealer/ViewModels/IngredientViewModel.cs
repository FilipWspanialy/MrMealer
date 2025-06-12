using MrMealer.Database.Models;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace MrMealer.ViewModels
{
    public class IngredientViewModel : INotifyPropertyChanged
    {
        private IngredientFromApi _selectedIngredient;
        private string _measure;

        public IngredientFromApi SelectedIngredient
        {
            get => _selectedIngredient;
            set
            {
                _selectedIngredient = value;
                OnPropertyChanged();
            }
        }

        public string Measure
        {
            get => _measure;
            set
            {
                _measure = value;
                OnPropertyChanged();
            }
        }
        public ICommand RemoveCommand { get; }

        public IngredientViewModel(Action<IngredientViewModel> removeCallback)
        {
            RemoveCommand = new Command(() => removeCallback?.Invoke(this));
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string name = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
    }
}
