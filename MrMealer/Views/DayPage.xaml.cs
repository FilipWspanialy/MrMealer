using MrMealer.Database;
using MrMealer.Models;
using MrMealer.ViewModels;

namespace MrMealer.Views
{
	public partial class DayPage : ContentPage
	{
		public DayPage()
		{
			InitializeComponent();
			BindingContext = new DayViewModel();
		}
        private void OnRecipeSelected(object sender, EventArgs e)
        {
            var picker = (Picker)sender;
            var selectedRecipe = (Recipe)picker.SelectedItem;

            if (picker.BindingContext is Meal meal && selectedRecipe != null)
            {
                if (BindingContext is DayViewModel vm)
                {
                    vm.AddRecipeToMeal(meal.Id, selectedRecipe.Id);
                }
            }
        }

    }
}