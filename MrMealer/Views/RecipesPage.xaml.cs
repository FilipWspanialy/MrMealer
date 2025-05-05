namespace MrMealer.Views
{
    public partial class RecipesPage : ContentPage
    {
        public RecipesPage()
        {
            InitializeComponent();
            BindingContext = new RecipesViewModel();
        }
    }
}