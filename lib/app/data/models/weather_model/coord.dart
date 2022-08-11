import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final double? lon;
  final double? lat;

  const Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: (json['lon'] as num?)?.toDouble(),
        lat: (json['lat'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };

  @override
  List<Object?> get props => [lon, lat];
}
