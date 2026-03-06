using NGeoHash;

    namespace WeatherServer.API.Helper
{
    public static class GeoHelper
    {
        public static string GetGeoHash(double latitude, double longitude)
        {
            return GeoHash.Encode(latitude, longitude, 6);
        }
    }
}