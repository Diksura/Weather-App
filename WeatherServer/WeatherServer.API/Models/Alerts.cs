using System.Text.Json.Serialization;

namespace WeatherServer.API.Models
{
    public record Alerts(
        List<Alert> alert
    );

    public record Alert(
    string headline,
    string msgtype,
    string severity,
    string urgency,
    string areas,
    string category,
    string certainty,
    [property: JsonPropertyName("event")] String eventDetail,
    string note,
    string effective,
    string expires,
    [property: JsonPropertyName("desc")] string description,
    string instruction,
    string isCritical
    );

    enum AlertSeverity
    {
     Low,
     Moderate,
     Extreme
    }
}
