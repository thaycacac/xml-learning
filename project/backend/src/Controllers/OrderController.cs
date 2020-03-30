using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

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
        /*
        //GET api/task
        [HttpGet]
        public async Task<IActionResult> Get(string model)
        {
            try
            {
                IEnumerable<TaskEntities> listTask = Enumerable.Empty<TaskEntities>();

                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var query = @"SELECT * FROM Task";
                    listTask = await connection.QueryAsync<TaskEntities>(query);
                }
                return Ok(listTask);
            } catch(Exception e)
            {
                return Ok(e.Message);
            }
            
        }

        // GET api/task/1
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                Entities.TaskEntities task;
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var query = @"SELECT * FROM Task WHERE Id = @Id";
                task = await connection.QuerySingleAsync<TaskEntities>(query, new {Id = id});
            }
            return Ok(new MessageAPI("S0001", task, "Get task success!!!"));
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }

        // POST api/task
        [HttpPost()]
        public async Task<IActionResult> Post([FromBody] TaskEntities model)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var query = @"INSERT INTO Task (title, description, complete)
                    VALUES (@title, @description, @complete)";
                await connection.ExecuteScalarAsync<int>(query, model);
            }
            return Ok(new MessageAPI("S0001", null, "Create task success!!!"));
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }

        // PUT api/task/id
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] TaskEntities model)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var query = @"UPDATE Task SET
                    title = @title,
                    description = @description,
                    complete = @complete
                    WHERE id = " + id;
                await connection.ExecuteScalarAsync<int>(query, model);
            }
            return Ok(new MessageAPI("S0001", null, "Update task success!!!"));
        }
            catch (Exception e)
            {
                return Ok(e.Message);
    }
}

        // DELETE api/task/id
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var query = "DELETE Task WHERE id = @id";
                await connection.ExecuteAsync(query, new {Id = id});
            }
            return Ok(new MessageAPI("S0001", null, "Delete task success!!!"));
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }
        */
    }
}
