class Resource<T> {
  Status status;
  T data;
  String message;

  Resource.idle() : status = Status.IDLE;
  Resource.loading(this.message) : status = Status.LOADING;
  Resource.success(this.data) : status = Status.SUCCESS;
  Resource.error(this.data, this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Resource{status: $status, data: $data, message: $message}';
  }
}

enum Status { IDLE, LOADING, SUCCESS, ERROR }
