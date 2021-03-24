import 'package:flutter_starter/consumer/model/movie_entity.dart';

movieModelEntityFromJson(MovieEntity data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['year'] != null) {
		data.year = json['year'] is String
				? int.tryParse(json['year'])
				: json['year'].toInt();
	}
	if (json['poster'] != null) {
		data.poster = json['poster'].toString();
	}
	if (json['synopsis'] != null) {
		data.synopsis = json['synopsis'].toString();
	}
	return data;
}

Map<String, dynamic> movieModelEntityToJson(MovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['year'] = entity.year;
	data['poster'] = entity.poster;
	data['synopsis'] = entity.synopsis;
	return data;
}