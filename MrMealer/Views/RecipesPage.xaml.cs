using MrMealer.Database;
using MrMealer.Database.Models;
using MrMealer.ViewModels;

namespace MrMealer.Views
{
    public partial class RecipesPage : ContentPage
    {
        public RecipesPage()
        {
            InitializeComponent();
            BindingContext = new RecipesViewModel();
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

            if (BindingContext is RecipesViewModel vm)
            {
                await vm.LoadRecipesAsync();
            }
        }

    }
}