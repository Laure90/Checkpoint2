using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public class Expedition
    {
        public string Name { get; set; }
        public Course Course { get; set; }
        public Agenda PeriodOfTime { get; set; }
        public List<Quest> QuestList { get; set; }
    }
}
