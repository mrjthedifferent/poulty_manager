sealed class ResponseHttp<T> {}

class ResponseHttpSuccess<T> extends ResponseHttp<T> {
  final T data;

  ResponseHttpSuccess(this.data);
}

class ResponseHttpError<T> extends ResponseHttp<T> {
  final String message;
  final StackTrace? staktrace;

  ResponseHttpError(this.message, [this.staktrace]);
}

class ResponseHttpLoading<T> extends ResponseHttp<T> {}
