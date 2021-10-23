class ApiResponseResource<T> {
  ResponseStatus status;
  T data;
  String error;

  ApiResponseResource.positive(this.data) : status = ResponseStatus.POSITIVE;
  ApiResponseResource.negative(this.error) : status = ResponseStatus.NEGATIVE;

  @override
  String toString() {
    return 'ApiResponseResource{status: $status, data: $data, error: $error}';
  }
}

enum ResponseStatus { POSITIVE, NEGATIVE }
