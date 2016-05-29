using System.ComponentModel.DataAnnotations;

namespace CodeFirstNewDatabaseSample
{
    public class User
    {
        [Key]
        public string Username { get; set; }
        public string DisplayName { get; set; }
    }

    public class Organization
    {
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }
    }
}