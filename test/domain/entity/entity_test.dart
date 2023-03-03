import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/data/models/weather.dart';
import 'package:pawang_hujan/domain/entity/clouds_entity.dart';
import 'package:pawang_hujan/domain/entity/coord_entity.dart';
import 'package:pawang_hujan/domain/entity/main_entity.dart';
import 'package:pawang_hujan/domain/entity/sys_entity.dart';
import 'package:pawang_hujan/domain/entity/weather_entity.dart';

void main() {
  group("Clouds Entity", () {
    const cloudsEntity1 = CloudsEntity(all: 65);
    const cloudsEntity2 = CloudsEntity(all: 65);
    const cloudsEntity3 = CloudsEntity(all: 55);

    test('supports value comparison', () {
      expect(cloudsEntity1 == cloudsEntity2, isTrue);
      expect(cloudsEntity1 == cloudsEntity3, isFalse);
    });

    test('returns correct props', () {
      final props = cloudsEntity1.props;

      expect(props, isList);
      expect(props.length, 1);
      expect(props[0], 65);
    });
  });

  group("Coord Entity", () {
    const coordEntity1 = CoordEntity(
      lon: 95.4108,
      lat: 5.5227,
    );
    const coordEntity2 = CoordEntity(
      lon: 95.4108,
      lat: 5.5227,
    );
    const coordEntity3 = CoordEntity(
      lon: 95.4109,
      lat: 5.5228,
    );

    test('supports value comparison', () {
      expect(coordEntity1 == coordEntity2, isTrue);
      expect(coordEntity1 == coordEntity3, isFalse);
    });

    test('returns correct props', () {
      final props = coordEntity1.props;

      expect(props, isList);
      expect(props.length, 2);
      expect(props[0], 95.4108);
      expect(props[1], 5.5227);
    });
  });

  group('Main Entity', () {
    const mainEntity1 = MainEntity(
      temp: 25.0,
      feelsLike: 27.0,
      tempMin: 23.0,
      tempMax: 26.0,
      pressure: 1015,
      humidity: 80,
      seaLevel: 1015,
      grndLevel: 1007,
    );

    const mainEntity2 = MainEntity(
      temp: 25.0,
      feelsLike: 27.0,
      tempMin: 23.0,
      tempMax: 26.0,
      pressure: 1015,
      humidity: 80,
      seaLevel: 1015,
      grndLevel: 1007,
    );

    const mainEntity3 = MainEntity(
      temp: 25.5,
      feelsLike: 28.0,
      tempMin: 24.0,
      tempMax: 27.0,
      pressure: 1014,
      humidity: 75,
      seaLevel: 1014,
      grndLevel: 1005,
    );

    test('supports value comparison', () {
      expect(mainEntity1 == mainEntity2, isTrue);
      expect(mainEntity1 == mainEntity3, isFalse);
    });

    test('returns correct props', () {
      final props = mainEntity1.props;

      expect(props, isList);
      expect(props.length, 8);
      expect(props[0], 25.0);
      expect(props[1], 27.0);
      expect(props[2], 23.0);
      expect(props[3], 26.0);
      expect(props[4], 1015);
      expect(props[5], 80);
      expect(props[6], 1015);
      expect(props[7], 1007);
    });
  });

  group("Sys Entity", () {
    const sysEntity1 = SysEntity(
      country: "ID",
      sunrise: 1676850797,
      sunset: 1676893882,
    );
    const sysEntity2 = SysEntity(
      country: "ID",
      sunrise: 1676850797,
      sunset: 1676893882,
    );
    const sysEntity3 = SysEntity(
      country: "US",
      sunrise: 1776850797,
      sunset: 1876893882,
    );

    test('supports value comparison', () {
      expect(sysEntity1 == sysEntity2, isTrue);
      expect(sysEntity1 == sysEntity3, isFalse);
    });

    test('returns correct props', () {
      final props = sysEntity1.props;

      expect(props, isList);
      expect(props.length, 3);
      expect(props[0], "ID");
      expect(props[1], 1676850797);
      expect(props[2], 1676893882);
    });
  });

  group('Weather props', () {
    test('props returns correct list of values', () {
      const weather = WeatherEntity(
        id: 1,
        main: 'Clouds',
        description: 'overcast clouds',
        icon: '04n',
      );
      expect(weather.props, [1, 'Clouds', 'overcast clouds', '04n']);
    });

    test('returns null values', () {
      const weather = WeatherEntity(
        id: null,
        main: null,
        description: null,
        icon: null,
      );
      expect(weather.props, [null, null, null, null]);
    });

    test('props contains correct values for WeatherEntity', () {
      const weather = Weather(
        id: 1,
        main: 'Clouds',
        description: 'overcast clouds',
        icon: '04n',
      );
      expect(
        weather.toEntity(),
        const WeatherEntity(
          id: 1,
          main: 'Clouds',
          description: 'overcast clouds',
          icon: '04n',
        ),
      );
    });
  });
}
