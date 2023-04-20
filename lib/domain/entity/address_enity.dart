import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? name;
  final String? street;
  final String? country;
  final String? area;
  final String? locality;
  final String? sublocality;

  const AddressEntity({
    this.name,
    this.street,
    this.country,
    this.area,
    this.locality,
    this.sublocality,
  });

  @override
  List<Object?> get props => [
        name,
        street,
        country,
        area,
        locality,
        sublocality,
      ];
}
