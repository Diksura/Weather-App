using System.Text.Json;
using WeatherServer.API.Models;

namespace WeatherServer.API.Services
{
    public class AstronomyWeatherService
    {

        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;

        public AstronomyWeatherService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
        }


        public async Task<WeatherAstro?> GetWeatherAstroAsync(float latitude, float longitude, string date)
        {
            try
            {
                var apiKey = _configuration["WeatherApi:ApiKey"];
                var baseUrl = _configuration["WeatherApi:BaseUrl"];
                var url = $"{baseUrl}astronomy.json?key={apiKey}&q={latitude},{longitude}&dt={date}";

                Console.WriteLine($"URL GetWeatherAstroAsync() --> {url}");
                var response = await _httpClient.GetAsync(url);
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"ERROR GetWeatherAstroAsync() --> \n        Status Code: {response.StatusCode}\n        Description: {response.Content}");
                    return null;
                }
                var content = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<WeatherAstro>(content);
            }
            catch (Exception e)
            {
                Console.WriteLine($"EXCEPTION GetWeatherAstroAsync() --> {e.Message}");
                return null;
            }
        }


    }
}
