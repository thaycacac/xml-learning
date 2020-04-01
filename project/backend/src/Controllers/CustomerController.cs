using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;
using SharpShop.Entities;
using System.Data.SqlClient;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SharpShop.Controllers
{
    [Route("api/user")]
    public class CustomerController : Controller
    {
        private string _connectionString;

        public CustomerController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        // POST api/user
        [HttpPost()]
        public async Task<IActionResult> Post([FromBody] UserDTO model)
        {
            try
            {
                Console.WriteLine("run");
                Customer user;
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"SELECT TOP 1 * FROM Customer WHERE username = @username AND password = @password";
                    user = await connection.QuerySingleAsync<Customer>(query, new { model.username, model.password });
                }
                return Ok(user);
            }
            catch (Exception e)
            {
                return Ok(new MessageDTO("fail", "Username or password wrong!!!"));
                throw e;
            }
        }

        //GET api/user/orders/{id}
        [HttpGet("orders/{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                IEnumerable<Order> orders = Enumerable.Empty<Order>();

                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"SELECT * FROM [Order] WHERE customerId = @id";
                    orders = await connection.QueryAsync<Order>(query, new { id });
                }
                return Ok(orders);
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }
    }
}
