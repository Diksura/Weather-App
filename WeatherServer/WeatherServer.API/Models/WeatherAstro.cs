namespace WeatherServer.API.Models
{
    public record WeatherAstro
        (
            Location location,
            Astronomy astronomy
        );

    public record Astronomy
        (
            Astro astro
        );
}
