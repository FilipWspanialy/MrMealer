
namespace MrMealer
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            //Task.Run(InitializeAppData);

            MainPage = new AppShell();
        }

        //private void InitializeAppData()
        //{
        //    throw new NotImplementedException();
        //}
    }
}
