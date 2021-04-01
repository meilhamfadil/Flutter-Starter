import 'package:flutter/material.dart';
import 'package:flutter_starter/consumer/model/comment_entity.dart';
import 'package:flutter_starter/consumer/model/post_entity.dart';
import 'package:flutter_starter/consumer/service/home_service.dart';
import 'package:flutter_starter/data/model/payload.dart';
import 'package:flutter_starter/data/util/api_service.dart';

abstract class HomeRepository {
  Future<List<PostEntity>> getPosts();

  Future<Payload<PostEntity>> getPost(String id);

  Future<List<CommentEntity>> getComments(String id);
}

class HomeRepositoryImpl extends HomeRepository {
  var _service = HomeService();

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      return _service.getPosts().response<List<PostEntity>>();
    } on Exception catch (e) {
      return List.empty();
    }
  }

  @override
  Future<Payload<PostEntity>> getPost(String id) async {
    try {
      var response = await _service.getPost(id).response<PostEntity>();
      return success(response);
    } on Exception catch (e) {
      return failure(e.toString());
    }
  }

  @override
  Future<List<CommentEntity>> getComments(String id) async {
    try {
      return _service.getComments(id).response();
    } on Exception catch (e) {
      return List.empty();
    }
  }
}
