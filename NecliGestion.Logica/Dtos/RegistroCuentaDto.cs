using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NecliGestion.Logica.Dtos;

    public record RegistroCuentaDto(

        int Id,
        string Nombre,
        string Apellido,
        string Email,
        string Contraseña,
        string Telefono,
        float Saldo,
        DateTime? FechaCreacion
      
    );