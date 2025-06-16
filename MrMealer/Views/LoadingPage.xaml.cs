namespace MrMealer.Views;

public partial class LoadingPage : ContentPage
{
    public LoadingPage()
    {
        InitializeComponent();
        StartLoading();
    }

    private async void StartLoading()
    {
        await Task.Delay(2000);
        Application.Current.MainPage = new AppShell();
    }
}