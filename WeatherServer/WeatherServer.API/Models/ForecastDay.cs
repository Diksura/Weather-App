using System.Text.Json.Serialization;

namespace WeatherServer.API.Models
{
    public record ForecastDay
        (
            string date,
            [property: JsonPropertyName("date_epoch")] int dateEpoch,
            [property: JsonPropertyName("day")] ForecastFullDay fullDay,
            Astro astro,
            [property: JsonPropertyName("hour")] List<ForecastHour> hourly
        );
}
