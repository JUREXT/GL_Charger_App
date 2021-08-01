class MainResponse {
  MainResponse._();
  factory MainResponse.success(dynamic data) = MySuccessState;
  factory MainResponse.error(dynamic data) = MyErrorState;
}

class MyErrorState extends MainResponse {
  MyErrorState(this.data): super._();
  final dynamic data;
}

class MySuccessState extends MainResponse {
  MySuccessState(this.data): super._();
  final dynamic data;
}