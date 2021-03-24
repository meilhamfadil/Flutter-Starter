import 'package:flutter_starter/generated/json/base/json_convert_content.dart';

class EmployeeEntity with JsonConvert<EmployeeEntity> {
	String name;
	String job;
	int age;
}
