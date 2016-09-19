using SchoolData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Linq;
using System.IO;

namespace SchoolTest
{
    class Program
    {
        static void Main(string[] args)
        {
            SchoolEntities context = new SchoolEntities();
            /*
            var students = from s in context.SD_Student.Include("SD_Person").AsEnumerable()
                           select 
                            new { Name = s.SD_Person.FirstName,
                                  Year = s.Year};

            foreach (var s in students)
            {
                Console.WriteLine(s.Name + " - " + s.Year.ToString());
            }
            */


            //loading courses assoc in SD_Person
            
            var people = from p in context.SD_Person
                         where p.Courses.Count > 0
                         select p;

            foreach (SD_Person person in people)
            {
                
                Console.WriteLine(person.FirstName + " is taking " + person.Courses.First().Title);
            }

            Console.Read();
        }
    }
}
