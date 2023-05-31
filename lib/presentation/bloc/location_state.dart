part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationData extends LocationState {
  final double lat;
  final double lon;
  final AddressEntity address;

  const LocationData(this.lat, this.lon, this.address);

  @override
  List<Object> get props => [lat, lon, address];
}
