using System.Text.Json;
using WeatherServer.API.Models;

namespace WeatherServer.API.Services
{
    public class WeatherAlertService
    {

        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;

        public WeatherAlertService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
        }


        public async Task<WeatherAlerts?> GetWeatherAlertAsync(float latitude, float longitude)
        {
            try
            {
                var apiKey = _configuration["WeatherApi:ApiKey"];
                var baseUrl = _configuration["WeatherApi:BaseUrl"];

                var url = $"{baseUrl}alerts.json?key={apiKey}&q={latitude},{longitude}";
                Console.WriteLine($"URL GetWeatherAlertAsync() --> {url}");

                var response = await _httpClient.GetAsync(url);
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"ERROR GetWeatherAlertAsync() --> \n        Status Code: {response.StatusCode}\n        Description: {response.Content}");
                    return null;
                }

                var content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<WeatherAlerts>(content);

            }
            catch (Exception e)
            {
                Console.WriteLine($"EXCEPTION GetWeatherAlertAsync() --> {e.Message}");
                return null;
            }

        }
    }
}
