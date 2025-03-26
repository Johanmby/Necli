using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NecliGestion.Logica.Dtos;

    public record RegistrarTransaccionDto(

        int Numero,
        DateTime? Fecha,
        string NumeroCuentaOrigen,
        string NumeroCuentaDestino,
        float Monto,
        string Tipo

    );
