using System.Text.Json.Serialization;

namespace WeatherServer.API.Models
{
    public record Location
        (
            string name,
            string region,
            string country,
            double lat,
            double lon,
            [property: JsonPropertyName("tz_id")] string tzID,
            [property: JsonPropertyName("localtime_epoch")] int localtimeEpoch,
            string localtime
        );
}
