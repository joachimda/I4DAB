using System.ComponentModel.DataAnnotations;

namespace CodeFirstNewDatabaseSample
{
    public class User
    {
        [Key]
        public string Username { get; set; }
        public string DisplayName { get; set; }
        public virtual Organization Organization { get; set; }
    }
}