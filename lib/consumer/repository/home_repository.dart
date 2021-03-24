import 'package:flutter_starter/consumer/service/home_service.dart';
import 'package:flutter_starter/consumer/model/movie_entity.dart';

abstract class HomeRepository {
  Future<List<MovieEntity>> getMovies();
}

class HomeRepositoryImpl extends HomeRepository {
  final HomeService service = HomeServiceImpl();

  @override
  Future<List<MovieEntity>> getMovies() async {
    var payload = await service.getMovies();
    return payload.data;
  }
}
