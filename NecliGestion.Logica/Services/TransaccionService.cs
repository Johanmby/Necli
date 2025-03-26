using NecliGestion.Entidades;
using NecliGestion.Logica.Dtos;
using NecliGestion.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NecliGestion.Logica.Services
{
    public class TransaccionService
    {
        private readonly TransaccionRepository _transaccionRepository = new TransaccionRepository();
        private readonly CuentaRepository _cuentaRepository = new CuentaRepository();

        public bool RegistrarTransaccion(RegistrarTransaccionDto transaccionDto)
        {
            if (transaccionDto.Monto < 1000 || transaccionDto.Monto > 5000000)
            {
                return false;
            }

            var transaccion = new Transaccion
            {
                Numero = transaccionDto.Numero,
                Fecha = DateTime.Now,
                NumeroCuentaOrigen = transaccionDto.NumeroCuentaOrigen,
                NumeroCuentaDestino = transaccionDto.NumeroCuentaDestino,
                Monto = transaccionDto.Monto,
                Tipo = transaccionDto.Tipo,
            };

            return _transaccionRepository.RegistrarTransaccion(transaccion);
        }

        public List<Transaccion> ConsultarTransacciones(int numero, DateTime? desde, DateTime? hasta)
        {
            return _transaccionRepository.ConsultarTransacciones(numero, desde, hasta);
        }
    }
}
