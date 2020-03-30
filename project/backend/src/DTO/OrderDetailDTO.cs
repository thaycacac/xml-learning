namespace SharpShop.Entities
{
    public class OrderDetailDTO
    {
        public string name { get; set; }

        public string image { get; set; }

        public double price { get; set; }

        public string description { get; set; }

        public string category { get; set; }

        public int quantity { get; set; }
    }
}