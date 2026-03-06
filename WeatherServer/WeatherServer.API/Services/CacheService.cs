using Microsoft.Extensions.Caching.Memory;

namespace WeatherServer.API.Services
{
    public class CacheService
    {

        private readonly IMemoryCache _cache;

        public CacheService(IMemoryCache cache)
        {
            _cache = cache;
        }

        public T? Get<T>(string key)
        {
            _cache.TryGetValue(key, out T? value);
            return value;
        }


        public void Set<T>(string key, T value, TimeSpan timeSpan)
        {
            var options = new MemoryCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = timeSpan
            };

            _cache.Set(key, value, options);
        }

    }
}
