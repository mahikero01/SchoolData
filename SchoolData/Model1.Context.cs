﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class SchoolEntities : DbContext
    {
        public SchoolEntities()
            : base("name=SchoolEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<SD_Course> SD_Course { get; set; }
        public virtual DbSet<SD_CourseGrade> SD_CourseGrade { get; set; }
        public virtual DbSet<SD_Department> SD_Department { get; set; }
        public virtual DbSet<SD_OfficeAssignment> SD_OfficeAssignment { get; set; }
        public virtual DbSet<SD_OnlineCourse> SD_OnlineCourse { get; set; }
        public virtual DbSet<SD_OnsiteCourse> SD_OnsiteCourse { get; set; }
        public virtual DbSet<SD_Person> SD_Person { get; set; }
    
        public virtual ObjectResult<SD_CourseGrade_GetStudentGrades_Result> SD_CourseGrade_GetStudentGrades(Nullable<int> studentID)
        {
            var studentIDParameter = studentID.HasValue ?
                new ObjectParameter("StudentID", studentID) :
                new ObjectParameter("StudentID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SD_CourseGrade_GetStudentGrades_Result>("SD_CourseGrade_GetStudentGrades", studentIDParameter);
        }
    
        public virtual int SD_OfficeAssignment_DeleteOfficeAssignment(Nullable<int> instructorID)
        {
            var instructorIDParameter = instructorID.HasValue ?
                new ObjectParameter("InstructorID", instructorID) :
                new ObjectParameter("InstructorID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SD_OfficeAssignment_DeleteOfficeAssignment", instructorIDParameter);
        }
    
        public virtual ObjectResult<byte[]> SD_OfficeAssignment_InsertOfficeAssignment(Nullable<int> instructorID, string location)
        {
            var instructorIDParameter = instructorID.HasValue ?
                new ObjectParameter("InstructorID", instructorID) :
                new ObjectParameter("InstructorID", typeof(int));
    
            var locationParameter = location != null ?
                new ObjectParameter("Location", location) :
                new ObjectParameter("Location", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<byte[]>("SD_OfficeAssignment_InsertOfficeAssignment", instructorIDParameter, locationParameter);
        }
    
        public virtual ObjectResult<byte[]> SD_OfficeAssignment_UpdateOfficeAssignment(Nullable<int> instructorID, string location, byte[] origTimestamp)
        {
            var instructorIDParameter = instructorID.HasValue ?
                new ObjectParameter("InstructorID", instructorID) :
                new ObjectParameter("InstructorID", typeof(int));
    
            var locationParameter = location != null ?
                new ObjectParameter("Location", location) :
                new ObjectParameter("Location", typeof(string));
    
            var origTimestampParameter = origTimestamp != null ?
                new ObjectParameter("OrigTimestamp", origTimestamp) :
                new ObjectParameter("OrigTimestamp", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<byte[]>("SD_OfficeAssignment_UpdateOfficeAssignment", instructorIDParameter, locationParameter, origTimestampParameter);
        }
    
        public virtual int SD_Person_DeletePerson(Nullable<int> personID)
        {
            var personIDParameter = personID.HasValue ?
                new ObjectParameter("PersonID", personID) :
                new ObjectParameter("PersonID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SD_Person_DeletePerson", personIDParameter);
        }
    
        public virtual ObjectResult<Nullable<decimal>> SD_Person_InsertPerson(string lastName, string firstName, Nullable<System.DateTime> hireDate, Nullable<System.DateTime> enrollmentDate)
        {
            var lastNameParameter = lastName != null ?
                new ObjectParameter("LastName", lastName) :
                new ObjectParameter("LastName", typeof(string));
    
            var firstNameParameter = firstName != null ?
                new ObjectParameter("FirstName", firstName) :
                new ObjectParameter("FirstName", typeof(string));
    
            var hireDateParameter = hireDate.HasValue ?
                new ObjectParameter("HireDate", hireDate) :
                new ObjectParameter("HireDate", typeof(System.DateTime));
    
            var enrollmentDateParameter = enrollmentDate.HasValue ?
                new ObjectParameter("EnrollmentDate", enrollmentDate) :
                new ObjectParameter("EnrollmentDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<decimal>>("SD_Person_InsertPerson", lastNameParameter, firstNameParameter, hireDateParameter, enrollmentDateParameter);
        }
    
        public virtual int SD_Person_UpdatePerson(Nullable<int> personID, string lastName, string firstName, Nullable<System.DateTime> hireDate, Nullable<System.DateTime> enrollmentDate)
        {
            var personIDParameter = personID.HasValue ?
                new ObjectParameter("PersonID", personID) :
                new ObjectParameter("PersonID", typeof(int));
    
            var lastNameParameter = lastName != null ?
                new ObjectParameter("LastName", lastName) :
                new ObjectParameter("LastName", typeof(string));
    
            var firstNameParameter = firstName != null ?
                new ObjectParameter("FirstName", firstName) :
                new ObjectParameter("FirstName", typeof(string));
    
            var hireDateParameter = hireDate.HasValue ?
                new ObjectParameter("HireDate", hireDate) :
                new ObjectParameter("HireDate", typeof(System.DateTime));
    
            var enrollmentDateParameter = enrollmentDate.HasValue ?
                new ObjectParameter("EnrollmentDate", enrollmentDate) :
                new ObjectParameter("EnrollmentDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SD_Person_UpdatePerson", personIDParameter, lastNameParameter, firstNameParameter, hireDateParameter, enrollmentDateParameter);
        }
    }
}