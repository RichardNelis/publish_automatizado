using Newtonsoft.Json;
using System.Collections.Generic;

public class SistemaCreateDTO : BaseDTO
{
    [JsonProperty(PropertyName = "nome_sistema", Order = 2)]
    public string NomeSistema { get; set; }

    [JsonProperty("caminho_sistema", Order = 3)]
    public string CaminhoSistema { get; set; }

    [JsonProperty("dependencias", Order = 4)]
    public ICollection<int> Dependencias { get; set; }
}