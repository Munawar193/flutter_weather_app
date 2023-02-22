enum RequestState { empty, loading, loaded, error }

extension RequestStateExtension on RequestState {
  String get value {
    switch (this) {
      case RequestState.empty:
        return 'empty';
      case RequestState.loading:
        return 'loading';
      case RequestState.loaded:
        return 'loaded';
      case RequestState.error:
        return 'error';
    }
  }
}

class RequestStateFactory {
  static RequestState fromValue(String value) {
    switch (value) {
      case 'empty':
        return RequestState.empty;
      case 'loading':
        return RequestState.loading;
      case 'loaded':
        return RequestState.loaded;
      case 'error':
        return RequestState.error;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}
