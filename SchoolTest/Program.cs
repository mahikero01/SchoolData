using SchoolData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolTest
{
    class Program
    {
        static void Main(string[] args)
        {
            SchoolEntities context = new SchoolEntities();
            var students = from s in context.SD_Student.Include("SD_Person").AsEnumerable()
                           select 
                            new { Name = s.SD_Person.FirstName,
                                  Year = s.Year};

            foreach (var s in students)
            {
                Console.WriteLine(s.Name + " - " + s.Year.ToString());
            }
            Console.Read();
        }
    }
}
