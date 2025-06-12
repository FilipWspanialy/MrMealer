using MrMealer.ViewModels;

namespace MrMealer.Views
{

	public partial class RecipeEditPage : ContentPage
	{
        public RecipeEditPage()
		{
			InitializeComponent();
            BindingContext = new RecipeEditViewModel();
        }
        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (BindingContext is RecipeEditViewModel vm && vm.RecipeId > 0)
            {
                await vm.LoadDataAsync(vm.RecipeId);
            }
        }
    }
}