sealed class RequestNetworkState<T> {
  final bool isLoading;
  final bool hasValue;
  final bool isIdle;

  final T? value;

  final Object? error;

  RequestNetworkState({
    required this.isLoading,
    required this.hasValue,
    required this.isIdle,
    this.value,
    this.error,
  });
}

class RequestNetworkInitial<T> extends RequestNetworkState<T> {
  RequestNetworkInitial()
      : super(hasValue: false, isIdle: true, isLoading: false);
}

class RequestNetworkLoading<T> extends RequestNetworkState<T> {
  RequestNetworkLoading()
      : super(hasValue: false, isIdle: false, isLoading: true);
}

class RequestNetworkData<T> extends RequestNetworkState<T> {
  RequestNetworkData(T value)
      : super(hasValue: true, isIdle: false, isLoading: false, value: value);
}

class RequestNetworkError<T> extends RequestNetworkState<T> {
  RequestNetworkError(Object e)
      : super(hasValue: false, isIdle: false, isLoading: false, error: e);
}
