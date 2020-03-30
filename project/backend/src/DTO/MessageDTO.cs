namespace SharpShop.Entities
{
    public class MessageDTO
    {
        public string status { get; set; }
        public string message { get; set; }

        public MessageDTO(string status, string message)
        {
            this.status = status;
            this.message = message;
        }
    }
}