import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/utils/state_enum.dart';

void main() {
  group('RequestState', () {
    test('fromValue returns RequestState.empty for "empty"', () {
      expect(RequestStateFactory.fromValue('empty'), RequestState.empty);
    });

    test('fromValue returns RequestState.loading for "loading"', () {
      expect(RequestStateFactory.fromValue('loading'), RequestState.loading);
    });

    test('fromValue returns RequestState.loaded for "loaded"', () {
      expect(RequestStateFactory.fromValue('loaded'), RequestState.loaded);
    });

    test('fromValue returns RequestState.error for "error"', () {
      expect(RequestStateFactory.fromValue('error'), RequestState.error);
    });

    test('fromValue throws ArgumentError for invalid value', () {
      expect(
          () => RequestStateFactory.fromValue('invalid'), throwsArgumentError);
    });
  });

  group('RequestStateExtension', () {
    test('value should return correct string', () {
      expect(RequestState.empty.value, 'empty');
      expect(RequestState.loading.value, 'loading');
      expect(RequestState.loaded.value, 'loaded');
      expect(RequestState.error.value, 'error');
    });
  });
}
