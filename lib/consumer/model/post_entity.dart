import 'package:flutter_starter/generated/json/base/json_convert_content.dart';

class PostEntity with JsonConvert<PostEntity> {
	int userId;
	int id;
	String title;
	String body;
}
