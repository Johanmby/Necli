using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NecliGestion.Entidades
{
    public class Transaccion
    {

        public required int Numero { get; set; }
        public required DateTime? Fecha { get; set; }
        public required string NumeroCuentaOrigen { get; set; }
        public required string NumeroCuentaDestino { get; set; }
        public required float Monto { get; set; }
        public required string Tipo { get; set; }

    }
}
