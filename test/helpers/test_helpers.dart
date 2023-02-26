import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:pawang_hujan/data/services/api/weather_data_source.dart';
import 'package:pawang_hujan/domain/repositories/domain_repository.dart';

@GenerateMocks([
  Dio,
  Geolocator,
  GeolocatorPlatform,
  WeatherDataSource,
  DomainRepository,
])
void main() {}
