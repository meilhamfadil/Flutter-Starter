class Payload<T> {
  bool isSuccess;
  T data;
  String message;

  Payload(this.isSuccess, this.data, this.message);
}
