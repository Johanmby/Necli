using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NecliGestion.Entidades;
using NecliGestion.Logica.Dtos;
using NecliGestion.Logica.Services;
namespace NecliGestionWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransaccionController : ControllerBase
    {
        private readonly TransaccionService _transaccionService = new TransaccionService();

        [HttpPost]
        public IActionResult RegistrarTransaccion([FromBody] RegistrarTransaccionDto transaccionDto)
        {
            if (transaccionDto == null)
            {
                return BadRequest("La transacción no puede estar vacía.");
            }

            bool resultado = _transaccionService.RegistrarTransaccion(transaccionDto);

            if (!resultado)
            {
                return BadRequest("No se pudo realizar la transacción. Verifique los datos.");
            }

            return Ok(new { mensaje = "Transacción registrada exitosamente." });
        }

        [HttpGet("{numero}")]
        public IActionResult ConsultarTransacciones(int numero, [FromQuery] DateTime? desde, [FromQuery] DateTime? hasta)
        {
            List<Transaccion> transacciones = _transaccionService.ConsultarTransacciones(numero, desde, hasta);

            if (transacciones == null || transacciones.Count == 0)
            {
                return NotFound("No se encontraron transacciones para la cuenta especificada.");
            }

            return Ok(transacciones);
        }
    }
}
