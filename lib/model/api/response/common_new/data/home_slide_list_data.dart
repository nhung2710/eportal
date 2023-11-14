import 'package:flutter/material.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class HomeSlideListData {
  int? total;
  int? id;
  String? tieuDe;
  String? tieuDePhu;
  String? moTa;
  String? lienKet;
  int? thuTu;
  bool? hoatDong;
  String? avatar;

  HomeSlideListData(
      {this.total,
      this.id,
      this.tieuDe,
      this.tieuDePhu,
      this.moTa,
      this.lienKet,
      this.thuTu,
      this.hoatDong,
      this.avatar});

  HomeSlideListData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    id = json['id'];
    tieuDe = json['tieuDe'];
    tieuDePhu = json['tieuDePhu'];
    moTa = json['moTa'];
    lienKet = json['lienKet'];
    thuTu = json['thuTu'];
    hoatDong = json['hoatDong'];
    avatar = json['avatar'];
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
