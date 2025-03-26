using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NecliGestion.Entidades;
using System.Text;
using NecliGestion.Entidades;
using NecliGestion.Logica.Dtos;
using NecliGestion.Logica.Services;

namespace NecliGestionWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CuentaController : ControllerBase
    {
        private readonly CuentaService _cuentaService = new CuentaService();

        [HttpGet]
        public IActionResult ListarCuentas()
        {
            try
            {
                var cuentas = _cuentaService.ListarCuentas();
                return Ok(cuentas);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        public IActionResult RegistrarCuenta([FromBody] RegistroCuentaDto cuentaDto)
        {
            try
            {
                var resultado = _cuentaService.RegistrarCuenta(cuentaDto);
                if (resultado)
                    return StatusCode(201, "Cuenta creada exitosamente");
                else
                    return BadRequest("No se pudo registrar la cuenta");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpGet("{telefono}")]
        public IActionResult ConsultarCuenta(string telefono)
        {
            var cuenta = _cuentaService.ConsultarCuenta(telefono);
            if (cuenta == null)
                return NotFound("Cuenta no encontrada");
            cuenta.Contraseña = "********"; // No mostrar la contraseña
            return Ok(cuenta);
        }

        [HttpPut]
        public IActionResult ActualizarCuenta([FromBody] Cuenta cuenta)
        {
            try
            {
                var resultado = _cuentaService.ActualizarCuenta(cuenta);
                if (resultado)
                    return Ok("Cuenta actualizada exitosamente");
                else
                    return BadRequest("No se pudo actualizar la cuenta");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete("{telefono}")]
        public IActionResult EliminarCuenta(string telefono)
        {
            try
            {
                var resultado = _cuentaService.EliminarCuenta(telefono);
                if (resultado)
                    return Ok("Cuenta eliminada exitosamente");
                else
                    return BadRequest("No se pudo eliminar la cuenta");
            }
            catch (ArgumentException ex)
            {
                return NotFound(ex.Message);
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }

}