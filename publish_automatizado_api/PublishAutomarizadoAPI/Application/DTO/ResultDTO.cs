public class ResultDTO
{
    public object Data { get; set; }

    public MessageDTO Message { get; set; }

    public ResultDTO()
    {
        Message = new MessageDTO();
    }
}