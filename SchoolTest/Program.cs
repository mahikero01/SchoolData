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
            var courses = from c in context.SD_Course select c;

            foreach (SD_Course c in courses)
            {
                Console.WriteLine(c.Title);
            }
            Console.Read();
        }
    }
}
