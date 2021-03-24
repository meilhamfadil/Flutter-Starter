// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_starter/consumer/model/movie_entity.dart';
import 'package:flutter_starter/generated/json/movie_model_entity_helper.dart';
import 'package:flutter_starter/consumer/model/employee_entity.dart';
import 'package:flutter_starter/generated/json/employee_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case MovieEntity:
				return movieModelEntityFromJson(data as MovieEntity, json) as T;
			case EmployeeEntity:
				return employeeEntityFromJson(data as EmployeeEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case MovieEntity:
				return movieModelEntityToJson(data as MovieEntity);
			case EmployeeEntity:
				return employeeEntityToJson(data as EmployeeEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (MovieEntity).toString()){
			return MovieEntity().fromJson(json);
		}	else if(type == (EmployeeEntity).toString()){
			return EmployeeEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<MovieEntity>[] is M){
			return data.map<MovieEntity>((e) => MovieEntity().fromJson(e)).toList() as M;
		}	else if(<EmployeeEntity>[] is M){
			return data.map<EmployeeEntity>((e) => EmployeeEntity().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}