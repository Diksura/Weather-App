namespace WeatherServer.API.Models
{
    public record Weather
        (
            Location location,
            Current current
        );
}
