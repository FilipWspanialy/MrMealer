using MrMealer.ViewModels;

namespace MrMealer.Views
{
    public partial class DayPage : ContentPage
    {
        private DayViewModel vm;

        public DayPage()
        {
            InitializeComponent();
            vm = new DayViewModel();
            BindingContext = vm;
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (vm.DayId > 0)
                await vm.LoadDataAsync();
        }
    }
}
