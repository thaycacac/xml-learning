using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SharpShop.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SharpShop.Controllers
{
    [Route("api/order")]
    public class CustomeraController : Controller
    {
        private string _connectionString;

        public CustomeraController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        //GET api/orders/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                IEnumerable<OrderDetailDTO> orders = Enumerable.Empty<OrderDetailDTO>();

                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"SELECT [name], image, price, quantity 
                                FROM OrderDetail 
                                INNER JOIN Product 
                                ON OrderDetail.productId = Product.id
                                WHERE orderId = @id";
                    orders = await connection.QueryAsync<OrderDetailDTO>(query, new { id });
                }
                return Ok(orders);
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }


        // POST api/order
        [HttpPost()]
        public async Task<IActionResult> Post([FromBody] Order model)
        {
            try
            {
                int idOrder;
                using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var query = @"INSERT INTO [Order] (customerId, status, orderDate, comment)
                    VALUES (@customerId, 'shipping', @orderDate, @comment); SELECT SCOPE_IDENTITY()";
                    idOrder = await connection.QuerySingleAsync<int>(query, new { model.customerId, model.orderDate, model.comment });
            }
            return Ok(idOrder);
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }

        // POST api/order/detail
        [HttpPost("detail")]
        public async Task<IActionResult> CreateOrderDetail([FromBody] OrderCreateDTO model)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"INSERT INTO [OrderDetail] (orderId, productId, quantity) VALUES (@orderID, @productID, @quantity); SELECT SCOPE_IDENTITY()";
                    await connection.QuerySingleAsync<int>(query, new { model.orderID, model.productID, model.quantity });
                }
                return Ok();
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }
    }
}
