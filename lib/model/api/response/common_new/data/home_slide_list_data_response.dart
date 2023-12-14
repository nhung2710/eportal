//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/model/base/base_eportal_data_response.dart';

class HomeSlideListDataResponse extends BaseEportalDataResponse {
  String? total;
  String? id;
  String? tieuDe;
  String? tieuDePhu;
  String? moTa;
  String? lienKet;
  String? thuTu;
  bool? hoatDong;
  String? avatar;

  HomeSlideListDataResponse(
      {this.total,
      this.id,
      this.tieuDe,
      this.tieuDePhu,
      this.moTa,
      this.lienKet,
      this.thuTu,
      this.hoatDong,
      this.avatar});

  HomeSlideListDataResponse.fromJson(Map<String, dynamic> json) {
    total = json['total']?.toString();
    id = json['id']?.toString();
    tieuDe = json['tieuDe']?.toString();
    tieuDePhu = json['tieuDePhu']?.toString();
    moTa = json['moTa']?.toString();
    lienKet = json['lienKet']?.toString();
    thuTu = json['thuTu']?.toString();
    hoatDong = json['hoatDong'];
    avatar = json['avatar']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['id'] = this.id;
    data['tieuDe'] = this.tieuDe;
    data['tieuDePhu'] = this.tieuDePhu;
    data['moTa'] = this.moTa;
    data['lienKet'] = this.lienKet;
    data['thuTu'] = this.thuTu;
    data['hoatDong'] = this.hoatDong;
    data['avatar'] = this.avatar;
    return data;
  }
}
