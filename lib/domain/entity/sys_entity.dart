import 'package:equatable/equatable.dart';

class SysEntity extends Equatable {
  final String? country;
  final int? sunrise;
  final int? sunset;

  const SysEntity({this.country, this.sunrise, this.sunset});

  @override
  List<Object?> get props => [country, sunrise, sunset];
}
