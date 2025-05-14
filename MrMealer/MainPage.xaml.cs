using MrMealer.ViewModels;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace MrMealer
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
            BindingContext = new TestVM();
        }
    }

}
