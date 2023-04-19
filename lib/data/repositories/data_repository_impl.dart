import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entity/weathers_entity.dart';
import '../../domain/exception/exception.dart';
import '../../domain/repositories/domain_repository.dart';
import '../../utils/failure.dart';
import '../services/api/weather_data_source.dart';

class DataRepositoryImpl implements DomainRepository {
  final WeatherDataSource dataSource;

  DataRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, WeathersEntity>> getWeatherApi(
    String lang,
    double lat,
    double lon,
  ) async {
    try {
      final result = await dataSource.getWeatherApi(lang, lat, lon);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
