using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public class PersonFactory
    {
        public static Person Createperson(string personStatus)
        {
            if(personStatus == "Student")
            {
                return new Student();
            }
            if (personStatus == "LeadTrainer")
            {
                return new LeadTrainer();
            }
            if (personStatus == "Trainer")
            {
                return new Trainer();
            }
            else
            {
                throw new Exception("It's not a valid word.");
            }
        }
    }
}
