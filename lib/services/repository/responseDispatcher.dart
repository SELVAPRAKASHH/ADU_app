class ResponseDispatcher {
  bool? status;
  String? message;
  Object? data;
  bool canRetry = false;
  ResponseDispatcher({this.data, this.message, this.status});
}