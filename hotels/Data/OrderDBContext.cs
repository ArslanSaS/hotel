using System.Data.Entity;
using hotel.Models;

namespace hotel.Data
{
    public class OrderDBContext : DbContext
    {
        public DbSet<Order> Orders { get; set; }
    }
}
