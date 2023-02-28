import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/data/models/clouds.dart';
import 'package:pawang_hujan/data/models/coord.dart';
import 'package:pawang_hujan/data/models/main.dart';
import 'package:pawang_hujan/data/models/sys.dart';
import 'package:pawang_hujan/data/models/weather.dart';
import 'package:pawang_hujan/data/models/weathers.dart';
import 'package:pawang_hujan/data/models/wind.dart';

void main() {
  group(
    'Weathers',
    (() {
      test('should be a subclass of Equatable', () {
        const weathers = Weathers();
        expect(weathers, isA<Equatable>());
      });
    }),
  );

  group("Clouds", () {
    test('should return a list of all properties', () {
      // Arrange
      const instance = Clouds(all: 65);

      // Act
      final props = instance.props;

      // Assert
      expect(props.length, equals(1));
      expect(props[0], equals(65));
    });
  });

  group("Coord", () {
    test('should return a list of all properties', () {
      // Arrange
      const instance = Coord(
        lon: 95.4108,
        lat: 5.5227,
      );

      // Act
      final props = instance.props;

      // Assert
      expect(props.length, equals(2));
      expect(props[0], 95.4108);
      expect(props[1], 5.5227);
    });
  });

  group('Main', () {
    test('should return a list of all properties', () {
      // Arrange
      const instance = Main(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 23.0,
        tempMax: 26.0,
        pressure: 1015,
        humidity: 80,
        seaLevel: 1015,
        grndLevel: 1007,
      );

      // Act
      final props = instance.props;

      // Assert
      expect(props.length, equals(8));
      expect(props[0], 25.0);
      expect(props[1], 27.0);
      expect(props[2], 23.0);
      expect(props[3], 26.0);
      expect(props[4], 1015);
      expect(props[5], 80);
      expect(props[6], 1015);
      expect(props[7], 1007);
    });

    const main1 = Main(
      temp: 25.0,
      feelsLike: 27.0,
      tempMin: 23.0,
      tempMax: 26.0,
      pressure: 1015,
      humidity: 80,
      seaLevel: 1015,
      grndLevel: 1007,
    );

    const main2 = Main(
      temp: 25.0,
      feelsLike: 27.0,
      tempMin: 23.0,
      tempMax: 26.0,
      pressure: 1015,
      humidity: 80,
      seaLevel: 1015,
      grndLevel: 1007,
    );

    const main3 = Main(
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
      expect(main1 == main2, isTrue);
      expect(main1 == main3, isFalse);
    });
  });

  group("Sys Entity", () {
    test('should return a list of all properties', () {
      // Arrange
      const instance = Sys(
        country: "ID",
        sunrise: 1676850797,
        sunset: 1676893882,
      );

      // Act
      final props = instance.props;

      // Assert
      expect(props.length, equals(3));
      expect(props[0], "ID");
      expect(props[1], 1676850797);
      expect(props[2], 1676893882);
    });

    const sys1 = Sys(
      country: "ID",
      sunrise: 1676850797,
      sunset: 1676893882,
    );
    const sys2 = Sys(
      country: "ID",
      sunrise: 1676850797,
      sunset: 1676893882,
    );
    const sys3 = Sys(
      country: "US",
      sunrise: 1776850797,
      sunset: 1876893882,
    );

    test('supports value comparison', () {
      expect(sys1 == sys2, isTrue);
      expect(sys1 == sys3, isFalse);
    });
  });

  group('Weather props', () {
    test('props returns correct list of values', () {
      const weather = Weather(
        id: 1,
        main: 'Clouds',
        description: 'overcast clouds',
        icon: '04n',
      );
      expect(weather.props, [1, 'Clouds', 'overcast clouds', '04n']);
    });

    test('returns null values', () {
      const weather = Weather(
        id: null,
        main: null,
        description: null,
        icon: null,
      );
      expect(weather.props, [null, null, null, null]);
    });
  });

  group("Wind", () {
    test('should return a list of all properties', () {
      // Arrange
      const instance = Wind(
        speed: 4.06,
        deg: 53,
        gust: 5.45,
      );

      // Act
      final props = instance.props;

      // Assert
      expect(props.length, equals(3));
      expect(props[0], equals(4.06));
      expect(props[1], equals(53));
      expect(props[2], equals(5.45));
    });
  });

  group('Weathers Equatable', () {
    test('props returns correct list of fields', () {
      const weathers = Weathers(
        coord: Coord(lat: 10.0, lon: 20.0),
        weather: [
          Weather(id: 1, main: 'Clear', description: 'clear sky', icon: '01d')
        ],
        base: 'stations',
        main: Main(
          temp: 29.0,
          feelsLike: 30.0,
          tempMin: 28.0,
          tempMax: 30.0,
          pressure: 1015,
          humidity: 74,
        ),
        visibility: 10000,
        wind: Wind(speed: 5.1, deg: 210),
        clouds: Clouds(all: 90),
        dt: 1645392075,
        sys: Sys(
          country: 'ID',
          sunrise: 1645361578,
          sunset: 1645405121,
        ),
        timezone: 25200,
        id: 1642911,
        name: 'Jakarta',
        cod: 200,
      );

      expect(weathers.props, [
        weathers.coord,
        weathers.weather,
        weathers.base,
        weathers.main,
        weathers.visibility,
        weathers.wind,
        weathers.clouds,
        weathers.dt,
        weathers.sys,
        weathers.timezone,
        weathers.id,
        weathers.name,
        weathers.cod,
      ]);
    });
  });
}
