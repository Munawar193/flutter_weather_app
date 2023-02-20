import 'package:equatable/equatable.dart';

import '../../domain/entity/sys_entity.dart';

class Sys extends Equatable {
  final String? country;
  final int? sunrise;
  final int? sunset;

  const Sys({this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json['country'] as String?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };

  SysEntity toEntity() => SysEntity(
        country: country,
        sunrise: sunrise,
        sunset: sunset,
      );

  @override
  List<Object?> get props => [country, sunrise, sunset];
}
