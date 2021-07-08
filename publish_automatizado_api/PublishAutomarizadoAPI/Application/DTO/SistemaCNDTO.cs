using Newtonsoft.Json;

public class SistemaCNDTO : BaseDTO
{
    [JsonProperty("nome_sistema", Order = 2)]
    public string NomeSistema { get; set; }

    [JsonProperty("caminho_sistema_cn", Order = 3)]
    public string CaminhoSistemaCN { get; set; }
}