using Newtonsoft.Json;

public class BaseDTO
{
    [JsonProperty(PropertyName = "id_codigo", Order = 1)]
    public int IdCodigo { get; set; }
}