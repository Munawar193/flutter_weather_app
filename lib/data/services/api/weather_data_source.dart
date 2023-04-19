import 'package:dio/dio.dart';

import '../../../domain/exception/exception.dart';
import '../../models/weathers.dart';

abstract class WeatherDataSource {
  Future<Weathers> getWeatherApi(String lang, double lat, double lon);
}

class WeatherDataSourceIMPL extends WeatherDataSource {
  static const apiURL = 'https://api.openweathermap.org/data/2.5/weather';
  static const appid = '1f2ac2140cc14ef9e6fa782d34018057';

  Dio dio = Dio();

  WeatherDataSourceIMPL({required this.dio});

  @override
  Future<Weathers> getWeatherApi(String lang, double lat, double lon) async {
    try {
      var url =
          "$apiURL?lat=$lat&lon=$lon&appid=$appid&lang=$lang&units=metric";
      Response response = await dio.get(url);
      return Weathers.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(e.toString());
    }
  }
}
