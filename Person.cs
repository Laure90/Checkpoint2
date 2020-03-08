using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public abstract class Person
    {
        public string Name { get; set; }
        public string PersonStatus { get; set; }
        public Agenda  Agenda { get; set; }
        
        public static List<Agenda> GetEventListOfAPerson(Person person)
        {
            List<Agenda> eventListOfPerson = Database.GetEventsListByPerson(person);
            return eventListOfPerson;
        }

        public static List<Agenda> GetEventListOfAPeriod(Event period)
        {
            List<Agenda> eventListOfPeriod = Database.GetAgendaByperiod(period);
            return eventListOfPeriod;
        }
    }
}
