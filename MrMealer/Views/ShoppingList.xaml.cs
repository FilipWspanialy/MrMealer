using MrMealer.ViewModels;

namespace MrMealer.Views
{
    public partial class ShoppingListPage : ContentPage
    {
        public ShoppingListPage()
        {
            InitializeComponent();
            BindingContext = new ShoppingListViewModel();
        }
        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (BindingContext is ShoppingListViewModel vm)
            {
                await vm.LoadIngredients();
            }
        }
    }
}
