import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/data/services/api/weather_data_source.dart';
import 'package:pawang_hujan/data/repositories/data_repository_impl.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/domain/repositories/domain_repository.dart';
import 'package:pawang_hujan/utils/failure.dart';

class MockDomainRepositoryR extends DomainRepository {
  @override
  Future<Either<Failure, WeathersEntity>> getWeatherApi(lang, lat, lon) async {
    // Return a dummy success value for the test
    return const Right(WeathersEntity(
      coord: null,
      weather: null,
      base: 'test_base',
      main: null,
      visibility: 0,
      wind: null,
      clouds: null,
      dt: 0,
      sys: null,
      timezone: 0,
      id: 0,
      name: 'test_name',
      cod: 0,
    ));
  }
}

class MockDomainRepositoryL extends DomainRepository {
  @override
  Future<Either<Failure, WeathersEntity>> getWeatherApi(lang, lat, lon) async {
    return const Left(ServerFailure('Server Error'));
  }
}

const String lang = 'id';
const double lat = 5.522470;
const double lon = 95.410808;

void main() {
  late MockDomainRepositoryR repositoryR;
  late MockDomainRepositoryL repositoryL;

  setUp(() {
    repositoryR = MockDomainRepositoryR();
    repositoryL = MockDomainRepositoryL();
  });

  group('getWeatherApi', () {
    test(
        'should return WeathersEntity when the call to the repository is successful',
        () async {
      // Arrange
      const expected = WeathersEntity(
        coord: null,
        weather: null,
        base: 'test_base',
        main: null,
        visibility: 0,
        wind: null,
        clouds: null,
        dt: 0,
        sys: null,
        timezone: 0,
        id: 0,
        name: 'test_name',
        cod: 0,
      );

      // Act
      final result = await repositoryR.getWeatherApi(lang, lat, lon);

      // Assert
      expect(result, equals(const Right(expected)));
    });

    test(
        'should return a Failure when the call to the repository is unsuccessful',
        () async {
      // Arrange
      const expected = ServerFailure('Server Error');

      // Act
      final result = await repositoryL.getWeatherApi(lang, lat, lon);

      // Assert
      expect(result, equals(const Left(expected)));
    });
  });

  Dio dio = Dio();
  final dataSource = WeatherDataSourceIMPL(dio: dio);
  group('DomainRepository', () {
    test('should return WeathersEntity when the call to API is successful',
        () async {
      final repository = DataRepositoryImpl(
        dataSource: dataSource,
      );
      final result = await repository.getWeatherApi(lang, lat, lon);

      expect(result, isA<Right<Failure, WeathersEntity>>());
    });
  });
}
