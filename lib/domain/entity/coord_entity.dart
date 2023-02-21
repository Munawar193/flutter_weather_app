import 'package:equatable/equatable.dart';

class CoordEntity extends Equatable {
  final double? lon;
  final double? lat;

  const CoordEntity({this.lon, this.lat});

  @override
  List<Object?> get props => [lon, lat];
}
