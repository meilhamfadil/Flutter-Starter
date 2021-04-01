
import 'consumer/model/post_entity.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final List<PostEntity> movies;

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
