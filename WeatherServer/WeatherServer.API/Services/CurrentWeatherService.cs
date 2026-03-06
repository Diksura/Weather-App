using System.Text.Json;
using WeatherServer.API.Models;

namespace WeatherServer.API.Services
{
    public class CurrentWeatherService
    {

        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;

        public CurrentWeatherService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
        }

        public async Task<Weather?> GetWeatherAsync(float latitude, float longitude, string? language = "")
        {
            try
            {
                var apiKey = _configuration["WeatherApi:ApiKey"];
                var baseUrl = _configuration["WeatherApi:BaseUrl"];

                var url = $"{baseUrl}current.json?key={apiKey}&q={latitude},{longitude}&aqi=yes";
                if (!string.IsNullOrEmpty(language))
                {
                    url += $"&lang={language}";
                }
                Console.WriteLine($"URL GetWeatherAsync() --> {url}");

                var response = await _httpClient.GetAsync(url);
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"ERROR GetWeatherAsync() --> \n        Status Code: {response.StatusCode}\n        Description: {response.Content}");
                    return null;
                }

                var content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<Weather>(content);

            }
            catch (Exception e)
            {
                Console.WriteLine($"EXCEPTION GetWeatherAsync() --> {e.Message}");
                return null;
            }
        }




    }
}
