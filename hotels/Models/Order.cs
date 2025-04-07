using System.ComponentModel.DataAnnotations;

namespace hotels.Models
{
    public class Order
    {
        [Key]
        public int room_id { get; set; }
        public int booking_id { get; set; }
        public int guest_id { get; set; }
        public int paiment_id { get; set; }
        public int order_id { get; set; }
        public int servece_id { get; set; }
        
    }
}