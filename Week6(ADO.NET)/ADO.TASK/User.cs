
namespace ADO.TASK
{
    public class User
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public bool Status { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }

        public int PostalCode { get; set; }
        public int CountryID { get; set; }
        public DateTime CreatedAt { get; set; }

        public User(int ID, string name, string email, string password, string status, string A1, string A2, string city, string state, int postalCode, int countryID)
        {
            this.Name = name;
            this.Email = email;
            this.Password = password;
            if(status == "Active")
            {
                this.Status = true;
            }
            else
            {
                 this.Status = false;
            }
            this.AddressLine1 = A1;
            this.AddressLine2 = A2;
            this.City = city;
            this.State = state;
            this.PostalCode = postalCode;
            this.CountryID = countryID;
            this.CreatedAt = DateTime.Now;
            this.ID = ID;
        }


        public override string ToString()
        {
            return $"{this.ID} ==> {this.Name} ==> {this.Email} ==> {(this.Status? "Active" : "Inactive")} ==> {this.AddressLine1} ==> {this.AddressLine2}" +
                $" ==> {this.City} ==> {this.State} ==> {this.PostalCode} ==> {this.CountryID}";
        }

    }
}
