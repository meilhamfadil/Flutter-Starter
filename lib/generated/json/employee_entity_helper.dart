import 'package:flutter_starter/consumer/model/employee_entity.dart';

employeeEntityFromJson(EmployeeEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['job'] != null) {
		data.job = json['job'].toString();
	}
	if (json['age'] != null) {
		data.age = json['age'] is String
				? int.tryParse(json['age'])
				: json['age'].toInt();
	}
	return data;
}

Map<String, dynamic> employeeEntityToJson(EmployeeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['job'] = entity.job;
	data['age'] = entity.age;
	return data;
}