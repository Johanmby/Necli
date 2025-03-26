using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NecliGestion.Entidades
{
    public class Cuenta
    {
        public required int Id { get; set; }
        public required string Nombre { get; set; }
        public required string Apellido { get; set; }
        public required string Email { get; set; }
        public required string Contraseña { get; set; }
        public required string Telefono { get; set; }
        public required float Saldo { get; set; }
        public required DateTime? FechaCreacion { get; set; }
    }
}
