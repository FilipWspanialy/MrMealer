using MrMealer.ViewModels;

namespace MrMealer.Views
{

	public partial class RecipeEditPage : ContentPage
	{
        private RecipeEditViewModel _vm;
        public RecipeEditPage()
		{
			InitializeComponent();
            BindingContext = new RecipeEditViewModel();
            

        }
        

    }

}