using MrMealer.ViewModels;

namespace MrMealer.Views;

public partial class MyRecipesPage : ContentPage
{
	public MyRecipesPage()
	{
		InitializeComponent();
		BindingContext = new MyRecipesViewModel();
	}
}