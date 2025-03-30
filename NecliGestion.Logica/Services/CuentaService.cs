using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NecliGestion.Entidades;
using NecliGestion.Persistencia;
using NecliGestion.Logica.Dtos;
namespace NecliGestion.Logica.Services
{
    public class CuentaService
    {
        private readonly CuentaRepository _cuentaRepository = new CuentaRepository();


        public bool RegistrarCuenta(RegistroCuentaDto CuentaDto)
        {

            //Mapeo Manual Dto a Entidad

            var cuenta = new Cuenta
            {

                Id = CuentaDto.Id,
                Nombre = CuentaDto.Nombre,
                Apellido = CuentaDto.Apellido,
                Email = CuentaDto.Email,
                Contraseña = CuentaDto.Contraseña,
                Telefono = CuentaDto.Telefono,
                Saldo = CuentaDto.Saldo,
                FechaCreacion = DateTime.Now
            };


            return _cuentaRepository.RegistrarCuenta(cuenta);
        }
        //Codigo para listar cuentas (GET)
        public List<Cuenta> ListarCuentas()
        {
            return _cuentaRepository.ListarCuenta();
        }

        //Codigo para consultar una cuenta por telefono (GET{telefono})
        public Cuenta ConsultarCuenta(string telefono)
        {
            return _cuentaRepository.ConsultarCuenta(telefono);
        }

        //Codigo para actualizar una cuenta (PUT)
        public bool ActualizarCuenta(Cuenta cuenta)
        {
            if (string.IsNullOrEmpty(cuenta.Nombre) || string.IsNullOrEmpty(cuenta.Email))
            {
                throw new ArgumentException("El nombre y el email son obligatorios.");
            }

            return _cuentaRepository.ActualizarCuenta(cuenta);
        }

        //Codigo para eliminar una cuenta (DELETE)
        public bool EliminarCuenta(string Telefono)
        {
            var cuenta = _cuentaRepository.ConsultarCuenta(Telefono);
            if (cuenta == null)
            {
                throw new ArgumentException("Cuenta no encontrada.");
            }

            if (cuenta.Saldo >= 50000)
            {
                throw new InvalidOperationException("No se puede eliminar una cuenta con saldo mayor a $50,000.");
            }

            return _cuentaRepository.EliminarCuenta(Telefono);
        }
    }
}

    
