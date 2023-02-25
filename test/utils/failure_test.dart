import 'package:flutter_test/flutter_test.dart';
import 'package:pawang_hujan/utils/failure.dart';

void main() {
  group('Failure tests', () {
    test('ServerFailure should have correct message', () {
      const message = 'Server error';
      const failure = ServerFailure(message);

      expect(failure.message, message);
      expect(failure.props, [message]);
    });

    test('ConnectionFailure should have correct message', () {
      const message = 'No internet connection';
      const failure = ConnectionFailure(message);

      expect(failure.message, message);
      expect(failure.props, [message]);
    });

    test('DatabaseFailure should have correct message', () {
      const message = 'Database error';
      const failure = DatabaseFailure(message);

      expect(failure.message, message);
      expect(failure.props, [message]);
    });
  });
}
