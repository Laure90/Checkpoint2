using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public class Course
    {
        public string Name { get; set; }
        public Agenda Duration { get; set; }
        public List<Expedition> ExpeditionList { get; set; }
    }
}
