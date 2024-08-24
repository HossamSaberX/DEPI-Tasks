namespace ADO.TASK
{
    using Microsoft.Data.SqlClient;

    internal class Program
    {

        static void Main(string[] args)
        {
            List<User> Users = new List<User>();


            using (StreamReader sr = new StreamReader("users.csv"))
            {
                int cnt = 0;
                string[] data = { };
                while (!sr.EndOfStream)
                {
                    data = sr.ReadLine().Split(',');

                    try
                    {
                        if (cnt > 0)
                        {
                            Users.Add(new User(int.Parse(data[0]), data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], int.Parse(data[9]), int.Parse(data[10])));

                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error Reading this row: {cnt} and the error log is ==> {ex.Message}");

                        continue;
                    }

                    ++cnt;

                }

            }

            SqlConnection sqlConnection = new SqlConnection("Server=OfficerK\\SQLEXPRESS;Database=UserDB;Integrated Security=True;TrustServerCertificate=True;");
            using (sqlConnection)
            {
            
                    try
                    {
                        sqlConnection.Open();

                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine($"Error in Connection ==> {ex.Message}");

                        return;
                    }
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnection;
                    sqlCommand.CommandText = "INSERT INTO USERS VALUES (@ID, @Name, @Email, @Password, @Status, @AddressLine1, @AddressLine2, @City, @State, @PostalCode, @CountryID, @CreatedAt)";
                    foreach (User user in Users)
                    {
                        sqlCommand.Parameters.AddWithValue("@ID", user.ID);
                        sqlCommand.Parameters.AddWithValue("@Name", user.Name);
                        sqlCommand.Parameters.AddWithValue("@Email", user.Email);
                        sqlCommand.Parameters.AddWithValue("@Password", user.Password);
                        sqlCommand.Parameters.AddWithValue("@Status", user.Status);
                        sqlCommand.Parameters.AddWithValue("@AddressLine1", user.AddressLine1);
                        sqlCommand.Parameters.AddWithValue("@AddressLine2", user.AddressLine2);
                        sqlCommand.Parameters.AddWithValue("@City", user.City);
                        sqlCommand.Parameters.AddWithValue("@State", user.State);
                        sqlCommand.Parameters.AddWithValue("@PostalCode", user.PostalCode);
                        sqlCommand.Parameters.AddWithValue("@CountryID", user.CountryID);
                        sqlCommand.Parameters.AddWithValue("@CreatedAt", user.CreatedAt);
                        try
                        {
                            sqlCommand.ExecuteNonQuery();

                        }
                        catch (SqlException ex)
                        {
                            Console.WriteLine($"Error in executing insertion! Record of user {user.Name} : {ex.Message} ");
                            throw;
                        }
                        sqlCommand.Parameters.Clear();
                    
                }
                
                Console.WriteLine("DataInsertion Complete");


            }
        }
    }
}
