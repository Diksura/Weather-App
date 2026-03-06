namespace WeatherServer.API.Models
{
    public record WeatherAlerts
        (
            Location location,
            Alerts alerts
        );
}
