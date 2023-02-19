import 'package:equatable/equatable.dart';

import '../../domain/entity/wind_entity.dart';

class Wind extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: (json['speed'] as num?)?.toDouble(),
        deg: json['deg'] as int?,
        gust: (json['gust'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };

  WindEntity toEntity() => WindEntity(
        speed: speed,
        deg: deg,
        gust: gust,
      );

  @override
  List<Object?> get props => [speed, deg, gust];
}
