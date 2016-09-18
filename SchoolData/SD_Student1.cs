using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace SchoolData
{
    public partial class SD_Student
    {
        public SchoolYear Year
        {
            get { return (SchoolYear)this.year; }
            set { year = (int)value; }
        }
    }

    public enum SchoolYear
    {
        Freshman = 1,
        Sophomore = 2,
        Junior = 3,
        Senior = 4
    }
}
