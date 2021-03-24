import 'package:bloc/bloc.dart';
import 'package:flutter_starter/consumer/model/movie_entity.dart';
import 'package:flutter_starter/consumer/repository/home_repository.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final List<MovieEntity> movies;

  MainLoaded(this.movies);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainLoaded &&
          runtimeType == other.runtimeType &&
          movies == other.movies;

  @override
  int get hashCode => movies.hashCode;
}

class MainError extends MainState {
  final String message;

  MainError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class MainCubit extends Cubit<MainState> {
  final HomeRepository _homeRepository = HomeRepositoryImpl();

  MainCubit() : super(MainInitial());

  Future<List<MovieEntity>> getMovies() async {
    try {
      emit(MainLoading());
      List<MovieEntity> movies = await _homeRepository.getMovies();
      emit(MainLoaded(movies));
    } on Exception {
      emit(MainError("Cannot Load data"));
    }
  }
}
