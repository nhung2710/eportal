//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
typedef T mapJson<T>(Map<String, dynamic> json);

extension MapJsonExtension on Map<String, dynamic> {
  T? toObjectJson<T>({String path = "data", required mapJson<T> mapJson}) {
    var data = this[path];
    if (data != null) return mapJson(data);
    return null;
  }

  List<T> toListObjectJson<T>(
      {String path = "data", required mapJson<T> mapJson}) {
    List<T> result = <T>[];
    var data = this[path];
    if (data != null) {
      data.forEach((v) {
        result.add(mapJson(v));
      });
    }
    return result;
  }

  String? toStringJson({String path = "data"}) {
    var data = this[path];
    if (data != null) return data?.toString();
    return null;
  }
}
