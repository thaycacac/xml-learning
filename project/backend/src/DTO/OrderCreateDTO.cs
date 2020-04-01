namespace SharpShop.Entities
{
    public class OrderCreateDTO
    {
        public int orderID { get; set; }

        public int productID { get; set; }

        public int quantity { get; set; }
    }
}