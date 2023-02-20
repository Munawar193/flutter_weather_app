import 'package:equatable/equatable.dart';
import 'package:pawang_hujan/domain/entity/coord_entity.dart';

class Coord extends Equatable {
  final double? lon;
  final double? lat;

  const Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: (json['lon'] as double?)?.toDouble(),
        lat: (json['lat'] as double?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };

  CoordEntity toEntity() => CoordEntity(lon: lon, lat: lat);

  @override
  List<Object?> get props => [lon, lat];
}
