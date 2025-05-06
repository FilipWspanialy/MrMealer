namespace MrMealer.Views
{
    public partial class RecipesPage : ContentPage
    {
        private RecipesViewModel _recipesVM;
        public RecipesPage()
        {
            InitializeComponent();
            _recipesVM = new RecipesViewModel();
            BindingContext = _recipesVM;
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await _recipesVM.LoadRecipes();
        }
        
    }
}