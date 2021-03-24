import 'package:dio/dio.dart';
import 'package:flutter_starter/consumer/model/movie_entity.dart';
import 'package:flutter_starter/data/model/payload.dart';
import 'package:flutter_starter/data/util/api_service.dart';

abstract class HomeService extends ApiService {
  Future<Payload<List<MovieEntity>>> getMovies();
}

class HomeServiceImpl extends HomeService {
  @override
  Future<Payload<List<MovieEntity>>> getMovies() async {
    try {
      Response response = await service.get("movies.json");
      print(response.data);
      List<MovieEntity> movies = (response.data as List)
          .map((it) => MovieEntity().fromJson(it))
          .toList();
      return success(movies, message: "OK");
    } on Exception catch (e) {
      return failure(e.toString());
    }
  }

  static final HomeServiceImpl _singleton = HomeServiceImpl._internal();

  factory HomeServiceImpl() {
    return _singleton;
  }

  HomeServiceImpl._internal();
}
