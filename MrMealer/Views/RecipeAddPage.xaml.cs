using MrMealer.ViewModels;

namespace MrMealer.Views
{
	public partial class RecipeAddPage : ContentPage
	{
		public RecipeAddPage()
		{
			InitializeComponent();
			BindingContext = new RecipeAddViewModel(); 
		}
	}
}