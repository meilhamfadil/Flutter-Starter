import 'package:bloc/bloc.dart';
import 'package:flutter_starter/consumer/repository/home_repository.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final HomeRepository _homeRepository = HomeRepositoryImpl();

  MainCubit() : super(MainInitial());

  getPosts() async {
    try {
      emit(MainLoading());
      var movies = await _homeRepository.getPosts();
      emit(MainLoaded(movies));
    } on Exception catch (e) {
      emit(MainError("Cannot Load data : $e"));
    }
  }
}
