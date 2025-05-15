using MrMealer.Models;

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
                // Navigacja do detali (np. przy u¿yciu Shell)
                await Shell.Current.GoToAsync($"recipeDetails?recipeId={selectedRecipe.Id}");
            }
        }

    }
}