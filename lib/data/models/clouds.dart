import 'package:equatable/equatable.dart';
import 'package:pawang_hujan/domain/entity/clouds_entity.dart';

class Clouds extends Equatable {
  final int? all;

  const Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };

  CloudsEntity toEntity() {
    return CloudsEntity(all: all);
  }

  @override
  List<Object?> get props => [all];
}
