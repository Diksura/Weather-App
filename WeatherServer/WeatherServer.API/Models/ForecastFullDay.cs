using System.Text.Json.Serialization;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace WeatherServer.API.Models
{
    public record ForecastFullDay
        (
            //[property: JsonPropertyName("hour")] string date,
            [property: JsonPropertyName("maxtemp_c")] double maxtempC,
            [property: JsonPropertyName("maxtemp_f")] double maxtempF,
            [property: JsonPropertyName("mintemp_c")] double mintempC,
            [property: JsonPropertyName("mintemp_f")] double mintempF,
            [property: JsonPropertyName("avgtemp_c")] double avgtempC,
            [property: JsonPropertyName("avgtemp_f")] double avgtempF,
            [property: JsonPropertyName("maxwind_mph")] double maxwindMph,
            [property: JsonPropertyName("maxwind_kph")] double maxwindKph,
            [property: JsonPropertyName("totalprecip_mm")] double totalprecipMm,
            [property: JsonPropertyName("totalprecip_in")] double totalprecipIn,
            [property: JsonPropertyName("totalsnow_cm")] double totalsnowCm,
            [property: JsonPropertyName("avgvis_km")] double avgvisKm,
            [property: JsonPropertyName("avgvis_miles")] double avgvisMiles,
            [property: JsonPropertyName("avghumidity")] double avghumidity,
            [property: JsonPropertyName("daily_will_it_rain")] int dailyWillItRain,
            [property: JsonPropertyName("daily_chance_of_rain")] double dailyChanceOfRain,
            [property: JsonPropertyName("daily_will_it_snow")] int dailyWillItSnow,
            [property: JsonPropertyName("daily_chance_of_snow")] double dailyChanceOfSnow,
            Condition condition,
            double uv,
            [property: JsonPropertyName("air_quality")] AirQuality airQuality
        );
}
