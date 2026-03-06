namespace WeatherServer.API.Models
{
    public record WeatherForecast
        (
            Location location,
            Current current,
            ForecastWeather forecast,
            Alerts alerts
        );

    public record ForecastWeather
        (
            List<ForecastDay> forecastday
        );
}
