using MrMealer.Database;
using MrMealer.Models;
using MrMealer.ViewModels;

namespace MrMealer.Views
{
    public partial class RecipesPage : ContentPage
    {
        private RecipesViewModel _vm;
        public RecipesPage()
        {
            InitializeComponent();
        }

        private async void OnRecipeSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.CurrentSelection.FirstOrDefault() is Recipe selectedRecipe)
            {
                await Shell.Current.GoToAsync($"recipeDetails?recipeId={selectedRecipe.Id}");
            }
        }
        private async void OnAddRecipeClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync("recipeAdd");
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (_vm == null)
            {
                _vm = new RecipesViewModel();
                BindingContext = _vm;
            }

            await _vm.LoadRecipesAsync();
        }

    }
}