using WeatherServer.API.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

builder.Services.AddMemoryCache();

builder.Services.AddSingleton<CacheService>();

builder.Services.AddHttpClient<CurrentWeatherService>();
builder.Services.AddHttpClient<ForecastWeatherService>();
builder.Services.AddHttpClient<AstronomyWeatherService>();
builder.Services.AddHttpClient<WeatherAlertService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
