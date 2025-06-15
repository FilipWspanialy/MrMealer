using MrMealer.Database.Models;
using MrMealer.ViewModels;

namespace MrMealer.Views;

public partial class PlanPage : ContentPage
{
	public PlanPage()
	{
		InitializeComponent();
		BindingContext = new PlanViewModel();
	}
    private async void OnDayTapped(object sender, EventArgs e)
    {
        if (sender is Frame frame && frame.BindingContext is Day selectedDay)
        {
            await Shell.Current.GoToAsync($"day?dayId={selectedDay.Id}");
        }
    }
}