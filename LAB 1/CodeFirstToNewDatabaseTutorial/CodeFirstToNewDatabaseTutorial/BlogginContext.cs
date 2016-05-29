using System.Data.Entity;

namespace CodeFirstToNewDatabaseTutorial
{
    public class BlogginContext : DbContext
    {
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Post> Posts { get; set; }
    }
}