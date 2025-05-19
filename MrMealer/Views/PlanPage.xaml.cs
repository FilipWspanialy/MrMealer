using MrMealer.Models;
using MrMealer.ViewModels;

namespace MrMealer.Views;

public partial class PlanPage : ContentPage
{
	public PlanPage()
	{
		InitializeComponent();
		BindingContext = new PlanViewModel();
	}
    private async void OnDaySelected(object sender, SelectionChangedEventArgs e)
    {
        if (e.CurrentSelection.FirstOrDefault() is Day selectedDay)
        {
            await Shell.Current.GoToAsync($"day?dayId={selectedDay.Id}");
        }
    }
}