import 'package:equatable/equatable.dart';

class Clouds extends Equatable {
  final int? all;

  const Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };

  @override
  List<Object?> get props => [all];
}
