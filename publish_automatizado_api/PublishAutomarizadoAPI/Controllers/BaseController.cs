using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;

public abstract class BaseController : ControllerBase
{
    public override CreatedAtActionResult CreatedAtAction(string actionName, object routeValues, [ActionResultObjectValue] object value)
    {
        ResultDTO result = new ResultDTO();
        result.Data = value;
        result.Message = MessageDTO.MensagensRetorno(MessageDTO.TiposMensagens.MensagemIncluidoSucesso);

        return base.CreatedAtAction(actionName, routeValues, result);
    }

    public override UnauthorizedResult Unauthorized()
    {
        _ = MessageDTO.MensagensRetorno(MessageDTO.TiposMensagens.MensagemDinamica, mensagem: "Usuário não autenticado!");
        return base.Unauthorized();
    }

    public override BadRequestObjectResult BadRequest([ActionResultObjectValue] object value)
    {
        return base.BadRequest(MessageDTO.MensagensRetorno(MessageDTO.TiposMensagens.MensagemDinamica, mensagem: value.ToString()));
    }

    public NotFoundObjectResult NotFound()
    {
        return base.NotFound(MessageDTO.MensagensRetorno(MessageDTO.TiposMensagens.MensagemDinamica, mensagem: "Não encontrado!"));
    }
}