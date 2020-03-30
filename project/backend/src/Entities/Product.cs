namespace SharpShop.Entities
{
    public class Product
    {
        public int id { get; set; }

        public string name { get; set; }

        public int quantityInStock { get; set; }

        public double price { get; set; }

        public string description { get; set; }

        public string category { get; set; }
    }
}