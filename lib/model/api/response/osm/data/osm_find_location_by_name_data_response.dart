//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class OsmFindLocationByNameDataResponse {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  String? type;
  int? placeRank;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  List<String>? boundingbox;

  OsmFindLocationByNameDataResponse({this.placeId, this.licence, this.osmType, this.osmId, this.lat, this.lon, this.type, this.placeRank, this.importance, this.addresstype, this.name, this.displayName, this.boundingbox});

  OsmFindLocationByNameDataResponse.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    type = json['type'];
    placeRank = json['place_rank'];
    importance = json['importance'];
    addresstype = json['addresstype'];
    name = json['name'];
    displayName = json['display_name'];
    boundingbox = json['boundingbox'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['licence'] = this.licence;
    data['osm_type'] = this.osmType;
    data['osm_id'] = this.osmId;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['type'] = this.type;
    data['place_rank'] = this.placeRank;
    data['importance'] = this.importance;
    data['addresstype'] = this.addresstype;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['boundingbox'] = this.boundingbox;
    return data;
  }
}