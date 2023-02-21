import 'package:dio/dio.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/domain/exception/exception.dart';

abstract class WeatherDataSource {
  Future<Weathers> getWeatherApi();
}

class WeatherDataSourceIMPL extends WeatherDataSource {
  static const apiURL = 'https://api.openweathermap.org/data/2.5/weather';
  static const appid = '1f2ac2140cc14ef9e6fa782d34018057';

  static const lang = 'id';
  static const lat = '5.522470';
  static const lon = '95.410808';

  Dio dio = Dio();

  WeatherDataSourceIMPL({required this.dio});

  @override
  Future<Weathers> getWeatherApi() async {
    const url = "$apiURL?lat=$lat&lon=$lon&appid=$appid&lang=$lang";
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return Weathers.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
