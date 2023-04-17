import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:pawang_hujan/data/services/api/weather_data_source.dart';
import 'package:pawang_hujan/data/models/clouds.dart';
import 'package:pawang_hujan/data/models/coord.dart';
import 'package:pawang_hujan/data/models/main.dart';
import 'package:pawang_hujan/data/models/sys.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/data/models/wind.dart';
import 'package:pawang_hujan/domain/exception/exception.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late WeatherDataSourceIMPL dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = WeatherDataSourceIMPL(dio: mockDio);
  });

  group('getWeatherApi', () {
    const String lang = 'id';
    const double lat = 5.522470;
    const double lon = 95.410808;
    const apiURL = 'https://api.openweathermap.org/data/2.5/weather';
    const appid = '1f2ac2140cc14ef9e6fa782d34018057';
    const String url =
        "$apiURL?lat=$lat&lon=$lon&appid=$appid&lang=$lang&units=metric";
    test(
      'should return weather model when the response is successful (200)',
      () async {
        final response = Response(
          data: {
            "coord": {
              "lon": 95.41,
              "lat": 5.52,
            },
            "weather": [
              {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
              }
            ],
            "base": "stations",
            "main": {
              "temp": 299.15,
              "feels_like": 302.87,
              "temp_min": 299.15,
              "temp_max": 299.15,
              "pressure": 1010,
              "humidity": 83
            },
            "visibility": 10000,
            "wind": {
              "speed": 4.12,
              "deg": 92,
              "gust": 5.83,
            },
            "clouds": {"all": 75},
            "dt": 1645219337,
            "sys": {
              "country": "ID",
              "sunrise": 1645199961,
              "sunset": 1645242762
            },
            "timezone": 25200,
            "id": 1214189,
            "name": "Banda Aceh",
            "cod": 200
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        );
        // arrange
        when(
          mockDio.get(url),
        ).thenAnswer((_) async => response);
        // act
        final result = await dataSource.getWeatherApi(lang, lat, lon);
        final weather = result.weather![0];
        // assert
        expect(result, isA<Weathers>());
        expect(result.coord, isA<Coord>());
        expect(result.coord?.lon, equals(95.41));
        expect(result.coord?.lat, equals(5.52));
        expect(result.weather, isNotNull);
        expect(result.weather!.length, equals(1));
        expect(weather.id, equals(803));
        expect(weather.main, equals('Clouds'));
        expect(weather.description, equals('broken clouds'));
        expect(weather.icon, equals('04d'));
        expect(result.base, equals("stations"));
        expect(result.main, isA<Main>());
        expect(result.main?.temp, equals(299.15));
        expect(result.main?.feelsLike, equals(302.87));
        expect(result.main?.tempMin, equals(299.15));
        expect(result.main?.tempMax, equals(299.15));
        expect(result.main?.pressure, equals(1010));
        expect(result.main?.humidity, equals(83));
        expect(result.visibility, equals(10000));
        expect(result.wind, isA<Wind>());
        expect(result.wind?.speed, equals(4.12));
        expect(result.wind?.deg, equals(92));
        expect(result.wind?.gust, equals(5.83));
        expect(result.clouds, isA<Clouds>());
        expect(result.clouds?.all, equals(75));
        expect(result.dt, equals(1645219337));
        expect(result.sys, isA<Sys>());
        expect(result.sys?.country, equals("ID"));
        expect(result.sys?.sunrise, equals(1645199961));
        expect(result.sys?.sunset, equals(1645242762));
        expect(result.timezone, equals(25200));
        expect(result.id, equals(1214189));
        expect(result.name, equals('Banda Aceh'));
        expect(result.cod, equals(200));
      },
    );

    test('throws ServerException on error', () async {
      final error = DioError(
        response: Response(
          statusCode: 404,
          data: {'message': 'Not Found'},
          requestOptions: RequestOptions(path: ""),
        ),
        type: DioErrorType.response,
        requestOptions: RequestOptions(path: ""),
      );

      when(mockDio.get(url, options: anyNamed('options'))).thenThrow(error);

      expect(() => dataSource.getWeatherApi(lang, lat, lon),
          throwsA(isA<ServerException>()));
    });
  });
}
