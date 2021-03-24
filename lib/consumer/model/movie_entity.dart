import 'package:flutter_starter/generated/json/base/json_convert_content.dart';

class MovieEntity with JsonConvert<MovieEntity> {
	String title;
	int year;
	String poster;
	String synopsis;
}
