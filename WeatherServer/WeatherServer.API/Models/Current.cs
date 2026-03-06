using System.Text.Json.Serialization;

namespace WeatherServer.API.Models
{
    public record Current
        (
            [property: JsonPropertyName("last_updated_epoch")] int lastUpdatedEpoch,
            [property: JsonPropertyName("last_updated")] string lastUpdated,
            [property: JsonPropertyName("temp_c")] double tempC,
            [property: JsonPropertyName("temp_f")] double tempF,
            [property: JsonPropertyName("is_day")] int isDay,
            Condition condition,
            [property: JsonPropertyName("wind_mph")] double windMph,
            [property: JsonPropertyName("wind_kph")] double windKph,
            [property: JsonPropertyName("wind_degree")] double windDegree,
            [property: JsonPropertyName("wind_dir")] string windDir,
            [property: JsonPropertyName("pressure_mb")] double pressureMb,
            [property: JsonPropertyName("pressure_in")] double pressureIn,
            [property: JsonPropertyName("precip_mm")] double precipMM,
            [property: JsonPropertyName("precip_in")] double precipIn,
            double humidity,
            double cloud,
            [property: JsonPropertyName("feelslike_c")] double feelslikeC,
            [property: JsonPropertyName("feelslike_f")] double feelslikeF,
            [property: JsonPropertyName("windchill_c")] double windchillC,
            [property: JsonPropertyName("windchill_f")] double windchillF,
            [property: JsonPropertyName("heatindex_c")] double heatindexC,
            [property: JsonPropertyName("heatindex_f")] double heatindexF,
            [property: JsonPropertyName("dewpoint_c")] double dewpointC,
            [property: JsonPropertyName("dewpoint_f")] double dewpointF,
            [property: JsonPropertyName("vis_km")] double visKm,
            [property: JsonPropertyName("vis_miles")] double visMi,
            double uv,
            [property: JsonPropertyName("gust_mph")] double gustMph,
            [property: JsonPropertyName("gust_kph")] double gustKph,
            [property: JsonPropertyName("air_quality")] AirQuality airQuality 
        );
}
