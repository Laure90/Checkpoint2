using System;
using System.Collections.Generic;
using System.Text;

namespace WCS
{
    public class LeadTrainer : Person
    {
        public List<Trainer> TrainerList { get; set; }

        public LeadTrainer (string name)
        {
            Name = name;
        }
    }
}
