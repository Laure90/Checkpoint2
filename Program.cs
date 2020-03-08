using CommandLine;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;

namespace WCS
{
    class Program
    {
        static void Main(string[] args)
        {
            Event newEvent = new Event("Important meeting");
            newEvent.StartTime = DateTime.Now;
            newEvent.EndTime = DateTime.Now + TimeSpan.FromHours(1);
            newEvent.Postpone(TimeSpan.FromHours(1));
            Console.WriteLine("Another meeting is postponed");

            Trainer.GetStudentsList("Bobby");
        }
    }
}
