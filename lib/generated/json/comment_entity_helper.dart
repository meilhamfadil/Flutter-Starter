import 'package:flutter_starter/consumer/model/comment_entity.dart';

commentEntityFromJson(CommentEntity data, Map<String, dynamic> json) {
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['body'] != null) {
		data.body = json['body'].toString();
	}
	return data;
}

Map<String, dynamic> commentEntityToJson(CommentEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postId'] = entity.postId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['email'] = entity.email;
	data['body'] = entity.body;
	return data;
}