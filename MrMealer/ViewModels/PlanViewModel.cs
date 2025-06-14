using MrMealer.Database;
using MrMealer.Database.Models;
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

            var outdatedDays = _db.Days.Where(d => d.Date < DateTime.Today).ToList();
            if (outdatedDays.Any())
            {
                foreach (var oldDay in outdatedDays)
                {
                    var meals = _db.Meals.Where(m => m.DayId == oldDay.Id).ToList();
                    _db.Meals.RemoveRange(meals);

                    _db.Days.Remove(oldDay);
                }
                _db.SaveChanges();
            }

            if (!_db.Days.Any())
            {
                AddWeek();
            }

            foreach (var day in _db.Days.OrderBy(r => r.Id).ToList())
            {
                Days.Add(day);
                if (day.Date != null)
                {
                    _lastdate = (DateTime)(day.Date ?? null);
                }
            }
        }
        private void AddWeek()
        {
            var startdate = default(DateTime);
            int daysToAdd = 7;
            if (_lastdate == default(DateTime))
            {
                startdate = DateTime.Today;
                daysToAdd = ((int)DayOfWeek.Sunday - (int)DateTime.Today.DayOfWeek + 7) % 7;
                if (daysToAdd == 0) daysToAdd = 7;

            }
            else
            {
                startdate = _lastdate.AddDays(1);
            }

            CultureInfo culture = new CultureInfo("en-US");
            var newDays = new List<Day>();

            for (int i = 0; i < daysToAdd; i++)
            {
                var date = startdate.AddDays(i);
                string dayName = culture.DateTimeFormat.GetDayName(date.DayOfWeek);

                var newDay = new Day
                {
                    Date = date,
                    Name = culture.TextInfo.ToTitleCase(dayName)
                };
                _db.Days.Add(newDay);
                Days.Add(newDay);
                newDays.Add(newDay);
            }
            _db.SaveChanges();
            foreach (var day in newDays)
            {
                AddMeals(day.Id);
            }
            _db.SaveChanges();
        }
        private void AddMeals(int dayId)
        {
            var existingMeals = _db.Meals.Where(m => m.DayId == dayId).ToList();
            if (existingMeals.Any())
                return;

            var meals = new List<Meal>
            {
                new Meal { Name = "Breakfast", DayId = dayId },
                new Meal { Name = "Lunch", DayId = dayId },
                new Meal { Name = "Dinner", DayId = dayId }
            };

            _db.Meals.AddRange(meals);
        }

    }
}
