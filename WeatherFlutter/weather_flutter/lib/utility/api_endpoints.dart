class ApiEndpoints {

  static const scheme = 'https';
  static const host = 'weather-api-541061882281.asia-south1.run.app';
  static const port = null; // Cloud Run uses default HTTPS port
  static const basePath = '/api/weather';

}

class ApiEndpointsLocal {

  static const scheme = 'http';
  static const host = '10.0.2.2'; // for emulator
  static const port = 5031;
  static const basePath = '/api/weather';

}