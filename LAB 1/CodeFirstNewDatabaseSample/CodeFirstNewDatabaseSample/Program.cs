using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstNewDatabaseSample
{
    class Program
    {
        static void Main(string[] args)
        {

            using (var db = new BloggingContext())
            {
                // Create and save a new Blog
                Console.Write("Enter Username: ");
                var userName = Console.ReadLine();
                Console.Write("Enter a name for a new Blog: ");
                var blogName = Console.ReadLine();
                Console.Write("Enter a name for a new Organisation: ");
                var orgName = Console.ReadLine();

                //Create entities
                var organization = new Organization { OrganizationName = orgName };
                var user = new User { Username = userName, Organization = organization };
                var blog = new Blog { Name = blogName };

                db.Users.Add(user);
                db.Organizations.Add(organization);
                db.Blogs.Add(blog);
                db.SaveChanges();

                // Query all Blogs from the database 
                var blogQuery = from b in db.Blogs
                            orderby b.Name
                            select b;

                // Query all Users from the database
                var userQuery = from u in db.Users
                                orderby u.Username
                                select u;

                // Query all Users from the database
                var orgQuery = from o in db.Organizations
                                orderby o.OrganizationName
                                select o;

                Console.WriteLine("All blogs in the database:");
                foreach (var item in userQuery)
                {
                    Console.WriteLine(item.Username + "is a member of the organization: " + item.Organization.OrganizationName);

                }

            }
        }
    }
}
