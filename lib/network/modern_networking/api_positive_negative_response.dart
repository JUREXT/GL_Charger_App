class ApiPositiveNegativeResponse<T> {
  ResponseStatus status;
  T data;

  ApiPositiveNegativeResponse.positive(this.data) : status = ResponseStatus.POSITIVE;
  ApiPositiveNegativeResponse.negative(this.data) : status = ResponseStatus.NEGATIVE;

  @override
  String toString() {
    return 'ApiPositiveNegativeResponse{status: $status, data: $data}';
  }
}

enum ResponseStatus { POSITIVE, NEGATIVE }
