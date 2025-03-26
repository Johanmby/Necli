using Microsoft.Data.SqlClient;
using NecliGestion.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NecliGestion.Persistencia
{
    public class TransaccionRepository
    {
        private readonly string _cadena_conexion = "Server=Johanexe\\SQLEXPRESS;Database=Necli;Trusted_Connection=True; TrustServerCertificate=True;";
        private string sql = "";

        public bool RegistrarTransaccion(Transaccion transaccion)
        {
            using (var conexion = new SqlConnection(_cadena_conexion))
            {
                var sql = @"INSERT INTO Transacciones (Numero, Fecha, NumeroCuentaOrigen, NumeroCuentaDestino, Monto, Tipo)
                            VALUES (@Numero, @Fecha, @NumeroCuentaOrigen, @NumeroCuentaDestino, @Monto, @Tipo); 
                            UPDATE Cuentas SET Saldo = Saldo - @Monto WHERE Numero = @NumeroCuentaOrigen;
                            UPDATE Cuentas SET Saldo = Saldo + @Monto WHERE Numero = @NumeroCuentaDestino;";

                using (var comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.AddWithValue("@Numero", transaccion.Numero);
                    comando.Parameters.AddWithValue("@Fecha", DateTime.Now);
                    comando.Parameters.AddWithValue("@NumeroCuentaOrigen", transaccion.NumeroCuentaOrigen);
                    comando.Parameters.AddWithValue("@NumeroCuentaDestino", transaccion.NumeroCuentaDestino);
                    comando.Parameters.AddWithValue("@Monto", transaccion.Monto);
                    comando.Parameters.AddWithValue("@Tipo", transaccion.Tipo);

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
            return true;
        }

        public List<Transaccion> ConsultarTransacciones(int numero, DateTime? desde, DateTime? hasta)
        {
            var transacciones = new List<Transaccion>();
            using (var conexion = new SqlConnection(_cadena_conexion))
            {
                var sql = "SELECT * FROM Transacciones WHERE NumeroCuentaOrigen = @Numero OR NumeroCuentaDestino = @Numero";
                if (desde.HasValue && hasta.HasValue)
                {
                    sql += " AND Fecha BETWEEN @Desde AND @Hasta";
                }

                using (var comando = new SqlCommand(sql, conexion))
                {
                    comando.Parameters.AddWithValue("@Numero", numero);
                    if (desde.HasValue && hasta.HasValue)
                    {
                        comando.Parameters.AddWithValue("@Desde", desde.Value);
                        comando.Parameters.AddWithValue("@Hasta", hasta.Value);
                    }

                    conexion.Open();
                    var lector = comando.ExecuteReader();
                    while (lector.Read())
                    {
                        transacciones.Add(new Transaccion
                        {
                            Numero = Convert.ToInt32(lector["Numero"]),
                            Fecha = Convert.ToDateTime(lector["Fecha"]),
                            NumeroCuentaOrigen = lector["NumeroCuentaOrigen"].ToString(),
                            NumeroCuentaDestino = lector["NumeroCuentaDestino"].ToString(),
                            Monto = Convert.ToSingle(lector["Monto"]),
                            Tipo = lector["Tipo"].ToString()
                        });
                    }
                }
            }
            return transacciones;
        }
    }
}
