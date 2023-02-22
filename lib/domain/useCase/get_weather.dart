import 'package:dartz/dartz.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/domain/repositories/domain_repository.dart';
import 'package:pawang_hujan/utils/failure.dart';

class GetWeather {
  final DomainRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, WeathersEntity>> execute() {
    return repository.getWeatherApi();
  }
}
