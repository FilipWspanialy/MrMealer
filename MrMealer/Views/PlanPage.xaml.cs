using MrMealer.ViewModels;

namespace MrMealer.Views;

public partial class PlanPage : ContentPage
{
	public PlanPage()
	{
		InitializeComponent();
		BindingContext = new PlanViewModel();
	}
}