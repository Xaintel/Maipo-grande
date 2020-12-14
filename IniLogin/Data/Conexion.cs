using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.OracleClient;
using System.Configuration;

namespace Data
{
    public abstract class Conexion
    {
        private readonly string OracleConnectionString;
        public Conexion()
        {
            OracleConnectionString = "DATA SOURCE = XE ; USER ID = ADMIN; PASSWORD = 123; UNICODE= true;";
            
            
         }
        protected OracleConnection GetConnection()
        {
            return new OracleConnection(OracleConnectionString);
        }
   

    }
}
