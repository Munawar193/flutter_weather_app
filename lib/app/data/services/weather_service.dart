import 'package:pawang_hujan/app/data/api/api_repository.dart';

import '../models/weather_model/weather_mode.dart';

class WeatherService {
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=1f2ac2140cc14ef9e6fa782d34018057';
  final String city;
  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    var url = "$baseUrl/weather?q=$city&$apiKey&units=metric";

    ApiRepository(url: url, payload: null).get(
        beforSend: () => {
              if (beforSend != null) {beforSend()}
            },
        onSuccess: (data) => {
              if (onSuccess != null)
                {onSuccess(CurrentWeatherData.fromJson(data))}
            },
        onError: (error) => {
              if (onError != null) {print(Error), onError(error)}
            });
  }
}
