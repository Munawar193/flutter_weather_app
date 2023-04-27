import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pawang_hujan/domain/entity/address_enity.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<OnLocationEvent>((event, emit) {
      emit(LocationLoading());

      final lat = event.lat;
      final lon = event.lon;
      final address = event.address;

      emit(LocationData(lat, lon, address));
    });
  }
}
