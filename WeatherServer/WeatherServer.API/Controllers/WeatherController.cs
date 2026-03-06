using Microsoft.AspNetCore.Mvc;

namespace WeatherServer.API.Controllers
{
    public class WeatherController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
