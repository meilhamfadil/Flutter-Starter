import 'package:flutter_starter/generated/json/base/json_convert_content.dart';

class CommentEntity with JsonConvert<CommentEntity> {
	int postId;
	int id;
	String name;
	String email;
	String body;
}
