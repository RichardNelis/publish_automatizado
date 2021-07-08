using Newtonsoft.Json;

public class MessageDTO
{
    [JsonProperty(PropertyName = "mensagem")]
    public string Mensagem { get; set; }

    public enum TiposMensagens
    {
        MensagemIncluidoSucesso = 0,
        MensagemAlteradoSucesso = 1,
        MensagemErro = 2,
        MensagemDinamica = 3,
    }

    public static MessageDTO MensagensRetorno(TiposMensagens tipo, string mensagem = null)
    {
        switch (tipo)
        {
            case TiposMensagens.MensagemIncluidoSucesso:
                mensagem = "Dados salvados com sucesso!";
                break;
            case TiposMensagens.MensagemAlteradoSucesso:
                mensagem = "Dados alterados com sucesso!";
                break;
            case TiposMensagens.MensagemErro:
                mensagem = "Desculpe encontrados um erro!\nTente novamente mais tarde.";
                break;
            case TiposMensagens.MensagemDinamica:
                break;
            default:
                break;
        }

        return new MessageDTO()
        {
            Mensagem = mensagem
        };
    }
}