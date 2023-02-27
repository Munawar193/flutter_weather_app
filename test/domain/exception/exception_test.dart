import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/domain/exception/exception.dart';

void main() {
  group('Exceptions test', () {
    test('Should throw ServerException', () {
      expect(() => throw ServerException(), throwsA(isA<ServerException>()));
    });

    test('Should throw DatabaseException', () {
      const message = 'Database error occurred';
      expect(
          () => throw DatabaseException(message),
          throwsA(isA<DatabaseException>()
              .having((e) => e.message, 'message', message)));
    });
  });
}
