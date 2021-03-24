import 'package:dio/dio.dart';
import 'package:flutter_starter/data/model/payload.dart';

class ApiService {
  Dio service;

  ApiService() {
    service = Dio(BaseOptions(
      baseUrl: "https://meilhamfadil.github.io/",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
  }
}

Payload<T> success<T>(T data, {String message = ""}) {
  return Payload(true, data, message);
}

Payload<T> failure<T>(String message, {T data}) {
  return Payload(false, data, message);
}
