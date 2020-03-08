using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public class Student : Person
    {
        public Trainer Trainer { get; set; }
        public Course Course { get; set; }

        public Student(string name)
        {
            Name = name;
        }
    }
}
