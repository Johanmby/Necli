using Microsoft.Data.SqlClient;
using System.Numerics;
using NecliGestion.Entidades;

namespace NecliGestion.Persistencia
{
    public class CuentaRepository
    {
        private readonly string _cadena_conexion = "Server=Johanexe\\SQLEXPRESS;Database=Necli;Trusted_Connection=True; TrustServerCertificate=True;";
        private string sql = "";

        public bool RegistrarCuenta(Cuenta cuenta)
        {


            using (var conexion = new SqlConnection(_cadena_conexion))
            {

                sql = @"INSERT INTO Cuentas (Id, Nombre, Apellido, Email, Contraseña, Telefono, Saldo, FechaCreacion)
                     VALUES(@Id, @Nombre, @Apellido, @Email, @Contraseña, @Telefono, @Saldo, @FechaCreacion)";


                using (var comando = new SqlCommand(sql, conexion))
                {


                    comando.Parameters.AddWithValue("@Id", cuenta.Id);
                    comando.Parameters.AddWithValue("@Nombre", cuenta.Nombre);
                    comando.Parameters.AddWithValue("@Apellido", cuenta.Apellido);
                    comando.Parameters.AddWithValue("@Email", cuenta.Email);
                    comando.Parameters.AddWithValue("@Contraseña", cuenta.Contraseña);
                    comando.Parameters.AddWithValue("@Telefono", cuenta.Telefono);
                    comando.Parameters.AddWithValue("@Saldo", cuenta.Saldo);
                    comando.Parameters.AddWithValue("@FechaCreacion", DateTime.Now);
                    conexion.Open();
                    comando.ExecuteNonQuery();

                }

            }


            return true;

        }

        public List<Cuenta> ListarCuenta()
        {

            var cuentas = new List<Cuenta>();

            using (var conexion = new SqlConnection(_cadena_conexion))
            {
                sql = "SELECT * FROM Cuentas";
                using (var comando = new SqlCommand(sql, conexion))
                {
                    conexion.Open();
                    var lector = comando.ExecuteReader();
                    while (lector.Read())
                    {
                        var cuenta = new Cuenta
                        {
                            Apellido = lector["Apellido"].ToString(),
                            Contraseña = lector["Contraseña"].ToString(),
                            Email = lector["Email"].ToString(),
                            FechaCreacion = DateTime.Parse(lector["FechaCreacion"].ToString()),
                            Id = Convert.ToInt32(lector["Id"].ToString()),
                            Nombre = lector["Nombre"].ToString(),
                            Telefono = lector["Telefono"].ToString(),
                            Saldo = Convert.ToSingle(lector["Saldo"].ToString())

                        };
                        cuentas.Add(cuenta);
                    }
                }


            }

            return cuentas;
        }

        public Cuenta ConsultarCuenta(string telefono)
        {
            using (var conexion = new SqlConnection(_cadena_conexion))
            {
                sql = "SELECT * FROM Cuentas WHERE Telefono =@Telefono";

                using (var comando = new SqlCommand(sql, conexion))
                {

                    comando.Parameters.AddWithValue("@Telefono", telefono);
                    conexion.Open();
                    var lector = comando.ExecuteReader();
                    while (lector.Read())
                    {
                        var cuenta = new Cuenta
                        {
                            Apellido = lector["Apellido"].ToString(),
                            Contraseña = lector["Contraseña"].ToString(),
                            Email = lector["Email"].ToString(),
                            FechaCreacion = DateTime.Parse(lector["FechaCreacion"].ToString()),
                            Id = Convert.ToInt32(lector["Id"].ToString()),
                            Nombre = lector["Nombre"].ToString(),
                            Telefono = lector["Telefono"].ToString(),
                            Saldo = Convert.ToSingle(lector["Saldo"].ToString())

                        };
                        return cuenta;
                    }
                }
            }



            return null;
        }


        public bool ActualizarCuenta(Cuenta cuenta)
        {
            using (var conexion = new SqlConnection(_cadena_conexion))
            {
                sql = "UPDATE Cuentas SET Contraseña = @Contraseña, Nombre = @Nombre, Apellido = @Apellido, " +
                      "Email = @Email, Telefono = @Telefono, Saldo = @Saldo WHERE Telefono =@Telefono";
                using (var comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.AddWithValue("@Id", cuenta.Id);
                    comando.Parameters.AddWithValue("@Nombre", cuenta.Nombre);
                    comando.Parameters.AddWithValue("@Apellido", cuenta.Apellido);
                    comando.Parameters.AddWithValue("@Email", cuenta.Email);
                    comando.Parameters.AddWithValue("@Contraseña", cuenta.Contraseña);
                    comando.Parameters.AddWithValue("@Telefono", cuenta.Telefono);
                    comando.Parameters.AddWithValue("@Saldo", cuenta.Saldo);
                    conexion.Open();
                    int filasAfectadas = comando.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }


        public bool EliminarCuenta(string Telefono)
        {
            using (var conexion = new SqlConnection(_cadena_conexion))
            {
                sql = "DELETE FROM Cuentas WHERE Telefono = @Telefono";
                using (var comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.AddWithValue("@Telefono", Telefono);
                    conexion.Open();
                    int filasAfectadas = comando.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }
    }
}
