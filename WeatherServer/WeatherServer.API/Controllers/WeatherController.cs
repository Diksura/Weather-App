using Microsoft.AspNetCore.Mvc;
using WeatherServer.API.Helper;
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

        private readonly CacheService _currentCacheService;
        private readonly CacheService _forecastCacheService;
        private readonly CacheService _astroCacheService;
        private readonly CacheService _alertCacheService;

        public WeatherController(
            CurrentWeatherService currentWeatherService, 
            ForecastWeatherService forecastWeatherService,
            AstronomyWeatherService astronomyWeatherService, 
            WeatherAlertService weatherAlertService,
            CacheService currentCacheService,
            CacheService forecastCacheService,
            CacheService astroCacheService,
            CacheService alertCacheService
            )
        {
            _currentWeatherService = currentWeatherService;
            _forecastWeatherService = forecastWeatherService;
            _astronomyWeatherService = astronomyWeatherService;
            _weatherAlertService = weatherAlertService;
            _currentCacheService = currentCacheService;
            _forecastCacheService = forecastCacheService;
            _astroCacheService = astroCacheService;
            _alertCacheService = alertCacheService;
        }


        [HttpGet("current")]
        public async Task<ActionResult<Weather?>> GetCurrentWeather(
            [FromQuery] float latitude,
            [FromQuery] float longitude,
            [FromQuery] string? language
            )
        {
            // Generate a geohash for the given latitude and longitude to use as part of the cache key
            string geoHash = GeoHelper.GetGeoHash(latitude, longitude);
            var cacheKey = $"current_{geoHash}_{language}";
            Console.WriteLine($"GetCurrentWeather() --> cacheKey: {cacheKey}");


            // Check if the data is in the cache
            Weather? weatherData = _currentCacheService.Get<Weather>(cacheKey);

            if (weatherData == null)
            {
                var weather = await _currentWeatherService.GetWeatherAsync(latitude, longitude, language);
                if (weather == null)
                {
                    return NotFound();
                }

                // Cache the result for future requests
                Console.WriteLine("GetCurrentWeather() --> From API");
                _currentCacheService.Set(cacheKey, weather, TimeSpan.FromMinutes(7));
                return Ok(weather);
            }

            Console.WriteLine("GetCurrentWeather() --> From CACHE");
            return Ok(weatherData);

        }


        [HttpGet("forecast")]
        public async Task<ActionResult<WeatherForecast?>> GetWeatherForecastAsync(
            [FromQuery] float latitude,
            [FromQuery] float longitude
            )
        {
            // Generate a geohash for the given latitude and longitude to use as part of the cache key
            string geoHash = GeoHelper.GetGeoHash(latitude, longitude);
            var cacheKey = $"forecast_{geoHash}";
            Console.WriteLine($"GetWeatherForecastAsync() --> cacheKey: {cacheKey}");


            // Check if the data is in the cache
            WeatherForecast? forecastData = _forecastCacheService.Get<WeatherForecast>(cacheKey);

            if (forecastData == null)
            {
                var weatherForecast = await _forecastWeatherService.GetWeatherForecastAsync(latitude, longitude);
                if (weatherForecast == null)
                {
                    return NotFound();
                }

                // Cache the result for future requests
                Console.WriteLine("GetWeatherForecastAsync() --> From API");
                _forecastCacheService.Set(cacheKey, weatherForecast, TimeSpan.FromMinutes(30));
                return Ok(weatherForecast);
            }

            Console.WriteLine("GetWeatherForecastAsync() --> From CACHE");
            return Ok(forecastData);
        }



        [HttpGet("astro")]
        public async Task<ActionResult<WeatherAstro?>> GetWeatherAstro(
            [FromQuery] float latitude,
            [FromQuery] float longitude,
            [FromQuery] string date
            )
        {
            // Generate a geohash for the given latitude and longitude to use as part of the cache key
            string geoHash = GeoHelper.GetGeoHash(latitude, longitude);
            var cacheKey = $"astro_{geoHash}_{date}";
            Console.WriteLine($"GetWeatherAstro() --> cacheKey: {cacheKey}");


            // Check if the data is in the cache
            WeatherAstro? astroData = _astroCacheService.Get<WeatherAstro>(cacheKey);

            if (astroData == null)
            {
                var weatherAstro = await _astronomyWeatherService.GetWeatherAstroAsync(latitude, longitude, date);
                if (weatherAstro == null)
                {
                    return NotFound();
                }

                // Cache the result for future requests
                Console.WriteLine("GetWeatherAstro() --> From API");
                _astroCacheService.Set(cacheKey, weatherAstro, TimeSpan.FromHours(6));
                return Ok(weatherAstro);
            }

            Console.WriteLine("GetWeatherAstro() --> From CACHE");
            return Ok(astroData);


        }


        [HttpGet("alerts")]
        public async Task<ActionResult<WeatherAlerts?>> GetWeatherAlertsAsync(
            [FromQuery] float latitude,
            [FromQuery] float longitude
            )
        {
            // Generate a geohash for the given latitude and longitude to use as part of the cache key
            string geoHash = GeoHelper.GetGeoHash(latitude, longitude);
            var cacheKey = $"alerts_{geoHash}";
            Console.WriteLine($"GetWeatherAlertsAsync() --> cacheKey: {cacheKey}");


            // Check if the data is in the cache
            WeatherAlerts? alertData = _alertCacheService.Get<WeatherAlerts>(cacheKey);

            if (alertData == null)
            {
                var weatherAlerts = await _weatherAlertService.GetWeatherAlertAsync(latitude, longitude);
                if (weatherAlerts == null)
                {
                    return NotFound();
                }

                // Cache the result for future requests
                Console.WriteLine("GetWeatherAlertsAsync() --> From API");
                _alertCacheService.Set(cacheKey, weatherAlerts, TimeSpan.FromMinutes(5));
                return Ok(weatherAlerts);
            }

            Console.WriteLine("GetWeatherAlertsAsync() --> From CACHE");
            return Ok(alertData);

        }



    }
}
