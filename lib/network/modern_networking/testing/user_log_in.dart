class ApiResult {
  ApiResult._();
  factory ApiResult.success(var data) = SuccessState;
  factory ApiResult.error(var data) = ErrorState;
}

class ErrorState<T> extends ApiResult {
  ErrorState(this.error): super._();
  final T error;
}

class SuccessState<T> extends ApiResult {
  SuccessState(this.data): super._();
  final T data;
}