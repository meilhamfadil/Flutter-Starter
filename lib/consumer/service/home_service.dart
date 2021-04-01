import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_starter/consumer/model/comment_entity.dart';
import 'package:flutter_starter/consumer/model/post_entity.dart';
import 'package:flutter_starter/data/util/api_service.dart';

class HomeService {
  var _api = ApiService();

  Future<Response<List<PostEntity>>> getPosts() {
    return _api.service.get<List<PostEntity>>("posts");
  }

  Future<Response<PostEntity>> getPost(String id) {
    return _api.service.get<PostEntity>("posts/$id");
  }

  Future<Response<List<CommentEntity>>> getComments(String id) {
    return _api.service.get<List<CommentEntity>>("/posts/$id/comments");
  }
}
