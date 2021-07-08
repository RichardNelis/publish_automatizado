using Microsoft.AspNetCore.Mvc;
using PublishAutomarizadoAPI.Application.Interfaces;
using System;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SistemaCNController : BaseController
    {
        private readonly IApplicationServiceSistemaCN _applicationService;

        public SistemaCNController(IApplicationServiceSistemaCN ApplicationService)
        {
            _applicationService = ApplicationService;
        }

        [HttpGet]
        public async Task<IActionResult> FetchAll()
        {
            return Ok(await _applicationService.FetchAllAsync());
        }

        [HttpGet("{Id}"), Route("[controller]"), ActionName("GetAsync")]
        public async Task<IActionResult> GetAsync(int Id)
        {
            return Ok(await _applicationService.GetByIdAsync(Id));
        }

        [HttpPost]
        public async Task<IActionResult> Post(SistemaCNDTO dto)
        {
            try
            {
                if (dto == null)
                {
                    throw new ArgumentException();
                }

                await _applicationService.AddAsync(dto);

                return CreatedAtAction(nameof(GetAsync), new { dto.IdCodigo }, dto);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao tentar salvar os dados");
            }
        }

        [HttpPut]
        public async Task<IActionResult> Put(SistemaCNDTO dto)
        {
            try
            {
                if (dto == null)
                {
                    throw new ArgumentException();
                }

                await _applicationService.UpdateAsync(dto);

                MessageDTO message = new MessageDTO()
                {
                    Mensagem = "Dados atualizados com sucesso!"
                };

                return Ok(message);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao tentar salvar os dados");
            }
        }

        [HttpDelete("{Id}")]
        public async Task<IActionResult> Delete(int Id)
        {
            try
            {
                await _applicationService.RemoveAsync(Id);

                MessageDTO message = new MessageDTO()
                {
                    Mensagem = "Registro excluído com sucesso!"
                };

                return Ok(message);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao deletar o registro.");
            }
        }
    }
}