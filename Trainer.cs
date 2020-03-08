using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public class Trainer : Person
    {
        public LeadTrainer LeadTrainer { get; set; }
        public List<Student> StudentList { get; set; } = new List<Student>();

        public Trainer(string name)
        {
            Name = name;
        }

        public static List<Student> GetStudentsList(string trainerName)
        {
            List<Student> studentList = Database.GetStudentListDB(trainerName);
            return studentList;
        }
    }
}
