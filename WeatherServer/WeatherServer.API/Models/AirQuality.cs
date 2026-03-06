using System.Text.Json.Serialization;

namespace WeatherServer.API.Models
{
    public record AirQuality(
            double co,
            double no2,
            double o3,
            double so2,
            double pm2_5,
            double pm10,
            [property: JsonPropertyName("us-epa-index")] double usEpaIndex,
            [property: JsonPropertyName("gb-defra-index")]  double gbDefraIndex
        );

}
