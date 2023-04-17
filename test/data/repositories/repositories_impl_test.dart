import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pawang_hujan/data/models/clouds.dart';
import 'package:pawang_hujan/data/models/coord.dart';
import 'package:pawang_hujan/data/models/main.dart';
import 'package:pawang_hujan/data/models/sys.dart';
import 'package:pawang_hujan/data/models/weather.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/data/models/wind.dart';
import 'package:pawang_hujan/data/repositories/data_repository_impl.dart';
import 'package:pawang_hujan/domain/exception/exception.dart';
import 'package:pawang_hujan/domain/repositories/domain_repository.dart';
import 'package:pawang_hujan/utils/failure.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late DomainRepository repository;
  late MockWeatherDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockWeatherDataSource();
    repository = DataRepositoryImpl(dataSource: mockDataSource);
  });

  group('getWeather', () {
    const tWeathers = Weathers(
      coord: Coord(lat: 10.0, lon: 20.0),
      weather: [
        Weather(
          id: 800,
          main: 'Clear',
          description: 'clear sky',
          icon: '01d',
        )
      ],
      base: 'stations',
      main: Main(
        temp: 23.0,
        feelsLike: 22.0,
        tempMin: 301.02,
        tempMax: 301.02,
        pressure: 1009,
        humidity: 73,
        seaLevel: 1009,
        grndLevel: 1006,
      ),
      visibility: 10000,
      wind: Wind(
        speed: 5.1,
        deg: 10,
        gust: 6.23,
      ),
      clouds: Clouds(all: 0),
      dt: 1645317185,
      sys: Sys(
        country: 'ID',
        sunrise: 1645312589,
        sunset: 1645354417,
      ),
      timezone: -28800,
      id: 5391959,
      name: 'Aceh',
      cod: 200,
    );
    final tWeathersEntity = tWeathers.toEntity();

    const String lang = 'id';
    const double lat = 0.0;
    const double lon = 0.0;

    test('should return weather entity from the data source', () async {
      // arrange
      when(mockDataSource.getWeatherApi(lang, lat, lon))
          .thenAnswer((_) async => tWeathers);
      // act

      final result = await repository.getWeatherApi(lang, lat, lon);
      // assert
      verify(mockDataSource.getWeatherApi(lang, lat, lon));
      expect(result, Right(tWeathersEntity));
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'should return a ServerFailure when the call to data source is unsuccessful',
        () async {
      // arrange
      when(mockDataSource.getWeatherApi(lang, lat, lon))
          .thenThrow(ServerException());
      // act
      final result = await repository.getWeatherApi(lang, lat, lon);
      // assert
      expect(result, const Left(ServerFailure('')));
      verify(mockDataSource.getWeatherApi(lang, lat, lon));
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        'should return a ConnectionFailure when there is no internet connection',
        () async {
      // arrange
      when(mockDataSource.getWeatherApi(lang, lat, lon))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getWeatherApi(lang, lat, lon);
      // assert
      expect(result,
          const Left(ConnectionFailure('Failed to connect to the network')));
      verify(mockDataSource.getWeatherApi(lang, lat, lon));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
