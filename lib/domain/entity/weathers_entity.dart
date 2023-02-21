import 'package:equatable/equatable.dart';
import 'package:pawang_hujan/domain/entity/clouds_entity.dart';
import 'package:pawang_hujan/domain/entity/coord_entity.dart';
import 'package:pawang_hujan/domain/entity/main_entity.dart';
import 'package:pawang_hujan/domain/entity/sys_entity.dart';
import 'package:pawang_hujan/domain/entity/weather_entity.dart';
import 'package:pawang_hujan/domain/entity/wind_entity.dart';

class WeathersEntity extends Equatable {
  final CoordEntity? coord;
  final List<WeatherEntity>? weather;
  final String? base;
  final MainEntity? main;
  final int? visibility;
  final WindEntity? wind;
  final CloudsEntity? clouds;
  final int? dt;
  final SysEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WeathersEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}
