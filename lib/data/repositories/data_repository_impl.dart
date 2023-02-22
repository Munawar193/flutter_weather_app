import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pawang_hujan/data/services/api/weather_data_source.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/domain/exception/exception.dart';
import 'package:pawang_hujan/utils/failure.dart';

import '../../domain/repositories/domain_repository.dart';

class DataRepositoryImpl implements DomainRepository {
  final WeatherDataSource dataSource;
  // final Geolocation location;

  DataRepositoryImpl({
    required this.dataSource,
    // required this.location,
  });

  @override
  Future<Either<Failure, WeathersEntity>> getWeatherApi() async {
    try {
      final result = await dataSource.getWeatherApi();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // @override
  // Future<Either<Failure, Position>> determinePosition() async {
  //   try {
  //     final result = await location.determinePosition();
  //     return Right(result);
  //   } on ServerException {
  //     return const Left(ServerFailure(''));
  //   } on SocketException {
  //     return const Left(ConnectionFailure(''));
  //   }
  // }
}
