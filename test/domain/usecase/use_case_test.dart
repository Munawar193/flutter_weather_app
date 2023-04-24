import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pawang_hujan/domain/entity/weathers_entity.dart';
import 'package:pawang_hujan/domain/useCase/get_weather.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late GetWeather usecase;
  late MockDomainRepository mockRepository;

  setUp(() {
    mockRepository = MockDomainRepository();
    usecase = GetWeather(mockRepository);
  });

  const tWeatherEntity = WeathersEntity(
    coord: null,
    weather: [],
    base: '',
    main: null,
    visibility: 0,
    wind: null,
    clouds: null,
    dt: 0,
    sys: null,
    timezone: 0,
    id: 0,
    name: '',
    cod: 0,
  );

  const String lang = 'id';
  const double lat = 5.522470;
  const double lon = 95.410808;

  test('should get weather from the repository', () async {
    // arrange
    when(mockRepository.getWeatherApi(lang, lat, lon))
        .thenAnswer((_) async => const Right(tWeatherEntity));

    // act
    final result = await usecase.execute(lang, lat, lon);

    // assert
    expect(result, const Right(tWeatherEntity));
    verify(mockRepository.getWeatherApi(lang, lat, lon));
    verifyNoMoreInteractions(mockRepository);
  });
}
