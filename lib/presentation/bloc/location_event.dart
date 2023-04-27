part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnLocationEvent extends LocationEvent {
  final double lat;
  final double lon;
  final AddressEntity address;

  const OnLocationEvent(this.lat, this.lon, this.address);

  @override
  List<Object> get props => [lat, lon, address];
}
