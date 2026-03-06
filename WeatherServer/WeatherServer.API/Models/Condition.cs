namespace WeatherServer.API.Models
{
    public record Condition
        (
            string text,
            string icon,
            int code
        );
}
