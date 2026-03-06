using Microsoft.AspNetCore.Mvc;
using WeatherServer.API.Models;
using WeatherServer.API.Services;

namespace WeatherServer.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WeatherController : Controller
    {
        private readonly CurrentWeatherService _currentWeatherService;
        private readonly ForecastWeatherService _forecastWeatherService;
        private readonly AstronomyWeatherService _astronomyWeatherService;
        private readonly WeatherAlertService _weatherAlertService;

        public WeatherController(
            CurrentWeatherService currentWeatherService, 
            ForecastWeatherService forecastWeatherService,
            AstronomyWeatherService astronomyWeatherService, 
            WeatherAlertService weatherAlertService
            )
        {
            _currentWeatherService = currentWeatherService;
            _forecastWeatherService = forecastWeatherService;
            _astronomyWeatherService = astronomyWeatherService;
            _weatherAlertService = weatherAlertService;
        }


        [HttpGet("current")]
        public async Task<ActionResult<Weather?>> GetCurrentWeather(
            [FromQuery] float latitude,
            [FromQuery] float longitude,
            [FromQuery] string? language
            )
        {
            var weather = await _currentWeatherService.GetWeatherAsync(latitude, longitude, language);
            if (weather == null)
            {
                return NotFound();
            }
            return Ok(weather);

        }


        [HttpGet("forecast")]
        public async Task<ActionResult<WeatherForecast?>> GetWeatherForecastAsync(
            [FromQuery] float latitude,
            [FromQuery] float longitude
            )
        {
            var weatherForecast = await _forecastWeatherService.GetWeatherForecastAsync(latitude, longitude);
            if (weatherForecast == null)
            {
                return NotFound();
            }
            return Ok(weatherForecast);
        }



        [HttpGet("astro")]
        public async Task<ActionResult<WeatherAstro?>> GetWeatherAstro(
            [FromQuery] float latitude,
            [FromQuery] float longitude,
            [FromQuery] string date
            )
        {
            var weatherAstro = await _astronomyWeatherService.GetWeatherAstroAsync(latitude, longitude, date);
            if (weatherAstro == null)
            {
                return NotFound();
            }
            return Ok(weatherAstro);

        }


        [HttpGet("alerts")]
        public async Task<ActionResult<WeatherAlerts?>> GetWeatherAlertsAsync(
            [FromQuery] float latitude,
            [FromQuery] float longitude
            )
        {
            var weatherAlerts = await _weatherAlertService.GetWeatherAlertAsync(latitude, longitude);
            if (weatherAlerts == null)
            {
                return NotFound();
            }
            return Ok(weatherAlerts);
        }



    }
}
