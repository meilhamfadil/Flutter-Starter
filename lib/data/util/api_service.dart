import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter/data/model/payload.dart';

class ApiService {
  Dio service = Dio(BaseOptions(
    baseUrl: env["API_URL"],
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();
}

Payload<T> success<T>(T data, {String message = ""}) {
  return Payload(true, data, message);
}

Payload<T> failure<T>(String message, {T data}) {
  return Payload(false, data, message);
}

extension loader on Future<Response<dynamic>> {
  Future<T> response<T>() async {
    return (await this).data as T;
  }
}
