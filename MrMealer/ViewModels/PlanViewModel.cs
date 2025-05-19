using MrMealer.Database;
using MrMealer.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;


namespace MrMealer.ViewModels
{
    public class PlanViewModel
    {
        private DateTime _lastdate;
        private readonly AppDbContext _db;
        public ObservableCollection<Day> Days { get; } = new();
        public ICommand AddWeekCommand { get; }

        public PlanViewModel()
        {
            _db = new AppDbContext();
            LoadDays();
            AddWeekCommand = new Command(AddWeekClicked);
        }

        private void AddWeekClicked(object obj)
        {
            AddWeek();
            LoadDays();
        }


        private void LoadDays()
        {
            Days.Clear();
            if (!_db.Days.Any())
            {
                AddWeek();

            }
            foreach (var day in _db.Days.OrderBy(r => r.Id).ToList())
            {
                //_db.Days.Remove(day);
                Days.Add(day);
                if (day.Date != null)
                {
                    _lastdate = (DateTime)(day.Date ?? null);
                }
            }
            //_db.SaveChanges();

        }
        private void AddWeek()
        {
            var startdate = default(DateTime);
            int daysToSunday = 7;
            if (_lastdate == default(DateTime))
            {
                startdate = DateTime.Today;
                daysToSunday = ((int)DayOfWeek.Sunday - (int)DateTime.Today.DayOfWeek + 7) % 7;

            }
            else
            {
                startdate = _lastdate;
            }

            CultureInfo culture = new CultureInfo("en-US");
            for (int i = 0; i < daysToSunday; i++)
            {
                var date = startdate.AddDays(i);
                string dayName = culture.DateTimeFormat.GetDayName(date.DayOfWeek);

                var newDay = new Day
                {
                    Date = date,
                    Name = culture.TextInfo.ToTitleCase(dayName)
                };

                _db.Days.Add(newDay);  
            }

            _db.SaveChanges(); 


        }

    }
}
