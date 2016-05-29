using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstToNewDatabaseTutorial
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new BlogginContext())
            {
                Console.WriteLine("Enter name for new Blog ");
                var name = Console.ReadLine();

                var blog = new Blog {Name = name};
                db.Blogs.Add(blog);
                db.SaveChanges();

                var query = from blogs in db.Blogs
                    orderby blogs.Name
                    select blogs;

                Console.WriteLine("All blogs in database: ");
                foreach (var blog1 in query)
                {
                    Console.WriteLine(blog1.Name);
                }

            }
        }
    }
}
