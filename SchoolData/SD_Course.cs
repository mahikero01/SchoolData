//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolData
{
    using System;
    using System.Collections.Generic;
    
    public partial class SD_Course
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SD_Course()
        {
            this.SD_CourseGrade = new HashSet<SD_CourseGrade>();
            this.Instructor = new HashSet<SD_Person>();
        }
    
        public int CourseID { get; set; }
        public string Title { get; set; }
        public int Credits { get; set; }
        public int DepartmentID { get; set; }
    
        public virtual SD_Department SD_Department { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SD_CourseGrade> SD_CourseGrade { get; set; }
        public virtual SD_OnlineCourse SD_OnlineCourse { get; set; }
        public virtual SD_OnsiteCourse SD_OnsiteCourse { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SD_Person> Instructor { get; set; }
    }
}
