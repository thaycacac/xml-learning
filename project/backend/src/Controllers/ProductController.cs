using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Dapper;
using SharpShop.Entities;

namespace SharpShop.Controllers
{
    [Route("api/products")]
    public class ProductController : Controller
    {
        private string _connectionString;

        public ProductController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        //GET api/products
        [HttpGet]
        public async Task<IActionResult> Get(string model)
        {
            try
            {
                IEnumerable<Product> products = Enumerable.Empty<Product>();

                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"SELECT * FROM Product";
                    products = await connection.QueryAsync<Product>(query);
                }
                return Ok(products);
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }

        // GET api/products/1
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            Console.WriteLine("cong hoa xa hoi chun nghia viet nam");
            try
            {
                Product product;
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"SELECT * FROM Product WHERE Id = @Id";
                    product = await connection.QuerySingleAsync<Product>(query, new { Id = id });
                }
                return Ok(product);
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }
    }
}
