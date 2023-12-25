//
// Created by BlackRose on 25/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class OsmFindNameByLocationResponse {
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
  Address? address;
  List<String>? boundingbox;

  OsmFindNameByLocationResponse({this.placeId, this.licence, this.osmType, this.osmId, this.lat, this.lon,  this.type, this.placeRank, this.importance, this.addresstype, this.name, this.displayName, this.address, this.boundingbox});

  OsmFindNameByLocationResponse.fromJson(Map<String, dynamic> json) {
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
  address = json['address'] != null ? new Address.fromJson(json['address']) : null;
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
  if (this.address != null) {
  data['address'] = this.address!.toJson();
  }
  data['boundingbox'] = this.boundingbox;
  return data;
  }
}

class Address {
  String? shop;
  String? houseNumber;
  String? road;
  String? quarter;
  String? suburb;
  String? city;
  String? iSO31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  Address({this.shop, this.houseNumber, this.road, this.quarter, this.suburb, this.city, this.iSO31662Lvl4, this.postcode, this.country, this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    shop = json['shop'];
    houseNumber = json['house_number'];
    road = json['road'];
    quarter = json['quarter'];
    suburb = json['suburb'];
    city = json['city'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop'] = this.shop;
    data['house_number'] = this.houseNumber;
    data['road'] = this.road;
    data['quarter'] = this.quarter;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['ISO3166-2-lvl4'] = this.iSO31662Lvl4;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    return data;
  }
}
