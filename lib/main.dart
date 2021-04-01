import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/consumer/model/post_entity.dart';
import 'package:flutter_starter/main_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'main_state.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getPosts(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Movie List"),
          ),
          body: Container(
            child: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                if (state is MainInitial) {
                  return mainView();
                } else if (state is MainLoading) {
                  return mainLoadingView();
                } else if (state is MainLoaded) {
                  return mainLoadedView(state.movies);
                } else if (state is MainError) {
                  return mainErrorView(state.message);
                } else {
                  return mainView();
                }
              },
            ),
          )),
    );
  }

  Widget mainView() {
    return Center(
      child: Text("Welcome to Movies"),
    );
  }

  Widget mainLoadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget mainLoadedView(List<PostEntity> list) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var movie = list[index];
        return ListTile(
          dense: true,
          title: Text(movie.title),
          subtitle: Text(movie.body.toString()),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black12,
        );
      },
    );
  }

  Widget mainErrorView(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error Detected : "),
          Text(message),
        ],
      ),
    );
  }
}
