import 'package:dartz/dartz.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/utils/failure.dart';

abstract class DomainRepository {
  Future<Either<Failure, WeathersEntity>> getWeatherApi(
    String lang,
    double lat,
    double lon,
  );
}
