class ApiResponse<T> {
  Status status;
  T data;
  String message;

  ApiResponse.idle() : status = Status.IDLE;
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.success(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.data, this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, message: $message}';
  }
}

enum Status { IDLE, LOADING, SUCCESS, ERROR }
