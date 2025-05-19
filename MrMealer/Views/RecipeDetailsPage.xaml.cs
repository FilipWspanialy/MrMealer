using Microsoft.Maui.Controls;
using MrMealer.ViewModels;

namespace MrMealer.Views
{
    public partial class RecipeDetailsPage : ContentPage
    {
        public RecipeDetailsPage()
        {
            InitializeComponent();
            BindingContext = new RecipeDetailsViewModel();
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();

            if (BindingContext is RecipeDetailsViewModel vm)
            {
                vm.Refresh();
            }
        }
    }
}
