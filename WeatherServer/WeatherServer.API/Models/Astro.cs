using System.Text.Json.Serialization;

namespace WeatherServer.API.Models
{
    public record Astro(
            string sunrise,
            string sunset,
            string moonrise,
            string moonset,
            [property: JsonPropertyName("moon_phase")] string moonPhase,
            [property: JsonPropertyName("moon_illumination")] double moonIllumination,
            [property: JsonPropertyName("is_moon_up")] int isMoonUp,
            [property: JsonPropertyName("is_sun_up")] int isSunUp
        );
}
