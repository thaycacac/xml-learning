using System;

namespace SharpShop.Entities

{
    public class Order
    {
        public int id { get; set; }

        public DateTime orderDate { get; set; }

        public DateTime shipDate { get; set; }

        public string status { get; set; }

        public string comment { get; set; }

        public int customerId { get; set; }
    }
}