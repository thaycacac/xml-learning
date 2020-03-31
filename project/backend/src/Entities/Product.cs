namespace SharpShop.Entities
{
    public class Product
    {
        public int id { get; set; }

        public string name { get; set; }

        public int quantityInStock { get; set; }

        public int price { get; set; }

        public string description { get; set; }

        public string category { get; set; }

        public string image { get; set; }

        public bool sale { get; set; }
    }
}