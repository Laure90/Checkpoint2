using System;
using System.Collections.Generic;
using System.Text;
using CommandLine;
using CommandLine.Text;

namespace WCS
{
    [Verb("event", HelpText = "Create a new account.")]
    class EventsByPersonOptions
    {
        [Option('p', "person", Required = true, HelpText = "Select your person")]
        public string PersonStatus { get; set; }

        [Option('b', "begins", Required = true, HelpText = "Put a begin date")]
        public string BeginDate { get; set; }

        [Option('e', "ends", Required = true, HelpText = "Put a end date")]
        public string EndDate { get; set; }
    }

    [Verb("cursus", HelpText = "Create a new account.")]
    class CursusOptions
    {
        [Option('p', "students", Required = true, HelpText = "Select your person")]
        public string Student { get; set; }

        [Option('n', "name", Required = true, HelpText = "Put a begin date", MetaValue = "students")]
        public string StudentsCursus { get; set; }

        [Option('q', "quests", Required = true, HelpText = "Put a begin date")]
        public string QuestsList { get; set; }

        [Option('n', "name", Required = true, HelpText = "Put a begin date", MetaValue = "quests")]
        public string QuestsCursus { get; set; }
    }
}
