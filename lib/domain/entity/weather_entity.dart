import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];
}
