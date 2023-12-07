import 'package:eportal/model/base/base_eportal_data_response.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class UserUpdateDataResponse extends BaseEportalDataResponse {
  int? affiliateID;
  String? displayName;
  String? email;
  String? firstName;
  bool? isDeleted;
  bool? isSuperUser;
  String? lastIPAddress;
  String? lastName;
  Membership? membership;
  String? passwordResetToken;
  String? passwordResetExpiration;
  int? portalID;
  Profile? profile;
  List<String>? roles;
  int? userID;
  String? username;
  String? vanityUrl;
  int? cacheability;
  int? createdByUserID;
  String? createdOnDate;
  int? lastModifiedByUserID;
  String? lastModifiedOnDate;

  UserUpdateDataResponse(
      {this.affiliateID,
      this.displayName,
      this.email,
      this.firstName,
      this.isDeleted,
      this.isSuperUser,
      this.lastIPAddress,
      this.lastName,
      this.membership,
      this.passwordResetToken,
      this.passwordResetExpiration,
      this.portalID,
      this.profile,
      this.roles,
      this.userID,
      this.username,
      this.vanityUrl,
      this.cacheability,
      this.createdByUserID,
      this.createdOnDate,
      this.lastModifiedByUserID,
      this.lastModifiedOnDate});

  UserUpdateDataResponse.fromJson(Map<String, dynamic> json) {
    affiliateID = json['affiliateID'];
    displayName = json['displayName'];
    email = json['email'];
    firstName = json['firstName'];
    isDeleted = json['isDeleted'];
    isSuperUser = json['isSuperUser'];
    lastIPAddress = json['lastIPAddress'];
    lastName = json['lastName'];
    membership = json['membership'] != null
        ? new Membership.fromJson(json['membership'])
        : null;
    passwordResetToken = json['passwordResetToken'];
    passwordResetExpiration = json['passwordResetExpiration'];
    portalID = json['portalID'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    roles = json['roles'].cast<String>();
    userID = json['userID'];
    username = json['username'];
    vanityUrl = json['vanityUrl'];
    cacheability = json['cacheability'];
    createdByUserID = json['createdByUserID'];
    createdOnDate = json['createdOnDate'];
    lastModifiedByUserID = json['lastModifiedByUserID'];
    lastModifiedOnDate = json['lastModifiedOnDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['affiliateID'] = this.affiliateID;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['isDeleted'] = this.isDeleted;
    data['isSuperUser'] = this.isSuperUser;
    data['lastIPAddress'] = this.lastIPAddress;
    data['lastName'] = this.lastName;
    if (this.membership != null) {
      data['membership'] = this.membership!.toJson();
    }
    data['passwordResetToken'] = this.passwordResetToken;
    data['passwordResetExpiration'] = this.passwordResetExpiration;
    data['portalID'] = this.portalID;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['roles'] = this.roles;
    data['userID'] = this.userID;
    data['username'] = this.username;
    data['vanityUrl'] = this.vanityUrl;
    data['cacheability'] = this.cacheability;
    data['createdByUserID'] = this.createdByUserID;
    data['createdOnDate'] = this.createdOnDate;
    data['lastModifiedByUserID'] = this.lastModifiedByUserID;
    data['lastModifiedOnDate'] = this.lastModifiedOnDate;
    return data;
  }
}

class Membership {
  bool? approved;
  String? createdDate;
  bool? isDeleted;
  bool? isOnLine;
  String? lastActivityDate;
  String? lastLockoutDate;
  String? lastLoginDate;
  String? lastPasswordChangeDate;
  bool? lockedOut;
  Null? password;
  Null? passwordAnswer;
  Null? passwordConfirm;
  Null? passwordQuestion;
  bool? updatePassword;

  Membership(
      {this.approved,
      this.createdDate,
      this.isDeleted,
      this.isOnLine,
      this.lastActivityDate,
      this.lastLockoutDate,
      this.lastLoginDate,
      this.lastPasswordChangeDate,
      this.lockedOut,
      this.password,
      this.passwordAnswer,
      this.passwordConfirm,
      this.passwordQuestion,
      this.updatePassword});

  Membership.fromJson(Map<String, dynamic> json) {
    approved = json['approved'];
    createdDate = json['createdDate'];
    isDeleted = json['isDeleted'];
    isOnLine = json['isOnLine'];
    lastActivityDate = json['lastActivityDate'];
    lastLockoutDate = json['lastLockoutDate'];
    lastLoginDate = json['lastLoginDate'];
    lastPasswordChangeDate = json['lastPasswordChangeDate'];
    lockedOut = json['lockedOut'];
    password = json['password'];
    passwordAnswer = json['passwordAnswer'];
    passwordConfirm = json['passwordConfirm'];
    passwordQuestion = json['passwordQuestion'];
    updatePassword = json['updatePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approved'] = this.approved;
    data['createdDate'] = this.createdDate;
    data['isDeleted'] = this.isDeleted;
    data['isOnLine'] = this.isOnLine;
    data['lastActivityDate'] = this.lastActivityDate;
    data['lastLockoutDate'] = this.lastLockoutDate;
    data['lastLoginDate'] = this.lastLoginDate;
    data['lastPasswordChangeDate'] = this.lastPasswordChangeDate;
    data['lockedOut'] = this.lockedOut;
    data['password'] = this.password;
    data['passwordAnswer'] = this.passwordAnswer;
    data['passwordConfirm'] = this.passwordConfirm;
    data['passwordQuestion'] = this.passwordQuestion;
    data['updatePassword'] = this.updatePassword;
    return data;
  }
}

class Profile {
  Null? cell;
  Null? city;
  Null? country;
  Null? fax;
  String? firstName;
  String? fullName;
  Null? im;
  bool? isDirty;
  String? lastName;
  String? photo;
  String? photoURL;
  String? photoURLFile;
  Null? postalCode;
  Null? preferredLocale;
  PreferredTimeZone? preferredTimeZone;
  List<ProfileProperties>? profileProperties;
  Null? region;
  Null? street;
  String? telephone;
  String? title;
  Null? unit;
  Null? website;
  Null? biography;

  Profile(
      {this.cell,
      this.city,
      this.country,
      this.fax,
      this.firstName,
      this.fullName,
      this.im,
      this.isDirty,
      this.lastName,
      this.photo,
      this.photoURL,
      this.photoURLFile,
      this.postalCode,
      this.preferredLocale,
      this.preferredTimeZone,
      this.profileProperties,
      this.region,
      this.street,
      this.telephone,
      this.title,
      this.unit,
      this.website,
      this.biography});

  Profile.fromJson(Map<String, dynamic> json) {
    cell = json['cell'];
    city = json['city'];
    country = json['country'];
    fax = json['fax'];
    firstName = json['firstName'];
    fullName = json['fullName'];
    im = json['im'];
    isDirty = json['isDirty'];
    lastName = json['lastName'];
    photo = json['photo'];
    photoURL = json['photoURL'];
    photoURLFile = json['photoURLFile'];
    postalCode = json['postalCode'];
    preferredLocale = json['preferredLocale'];
    preferredTimeZone = json['preferredTimeZone'] != null
        ? new PreferredTimeZone.fromJson(json['preferredTimeZone'])
        : null;
    if (json['profileProperties'] != null) {
      profileProperties = <ProfileProperties>[];
      json['profileProperties'].forEach((v) {
        profileProperties!.add(new ProfileProperties.fromJson(v));
      });
    }
    region = json['region'];
    street = json['street'];
    telephone = json['telephone'];
    title = json['title'];
    unit = json['unit'];
    website = json['website'];
    biography = json['biography'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cell'] = this.cell;
    data['city'] = this.city;
    data['country'] = this.country;
    data['fax'] = this.fax;
    data['firstName'] = this.firstName;
    data['fullName'] = this.fullName;
    data['im'] = this.im;
    data['isDirty'] = this.isDirty;
    data['lastName'] = this.lastName;
    data['photo'] = this.photo;
    data['photoURL'] = this.photoURL;
    data['photoURLFile'] = this.photoURLFile;
    data['postalCode'] = this.postalCode;
    data['preferredLocale'] = this.preferredLocale;
    if (this.preferredTimeZone != null) {
      data['preferredTimeZone'] = this.preferredTimeZone!.toJson();
    }
    if (this.profileProperties != null) {
      data['profileProperties'] =
          this.profileProperties!.map((v) => v.toJson()).toList();
    }
    data['region'] = this.region;
    data['street'] = this.street;
    data['telephone'] = this.telephone;
    data['title'] = this.title;
    data['unit'] = this.unit;
    data['website'] = this.website;
    data['biography'] = this.biography;
    return data;
  }
}

class PreferredTimeZone {
  String? id;
  String? displayName;
  String? standardName;
  String? daylightName;
  String? baseUtcOffset;
  Null? adjustmentRules;
  bool? supportsDaylightSavingTime;

  PreferredTimeZone(
      {this.id,
      this.displayName,
      this.standardName,
      this.daylightName,
      this.baseUtcOffset,
      this.adjustmentRules,
      this.supportsDaylightSavingTime});

  PreferredTimeZone.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    displayName = json['DisplayName'];
    standardName = json['StandardName'];
    daylightName = json['DaylightName'];
    baseUtcOffset = json['BaseUtcOffset'];
    adjustmentRules = json['AdjustmentRules'];
    supportsDaylightSavingTime = json['SupportsDaylightSavingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['DisplayName'] = this.displayName;
    data['StandardName'] = this.standardName;
    data['DaylightName'] = this.daylightName;
    data['BaseUtcOffset'] = this.baseUtcOffset;
    data['AdjustmentRules'] = this.adjustmentRules;
    data['SupportsDaylightSavingTime'] = this.supportsDaylightSavingTime;
    return data;
  }
}

class ProfileProperties {
  int? dataType;
  String? defaultValue;
  int? defaultVisibility;
  bool? deleted;
  bool? isDirty;
  int? length;
  int? moduleDefId;
  int? portalId;
  String? propertyCategory;
  int? propertyDefinitionId;
  String? propertyName;
  String? propertyValue;
  bool? readOnly;
  bool? required;
  String? validationExpression;
  int? viewOrder;
  bool? visible;
  int? visibility;
  int? createdByUserID;
  String? createdOnDate;
  int? lastModifiedByUserID;
  String? lastModifiedOnDate;

  ProfileProperties(
      {this.dataType,
      this.defaultValue,
      this.defaultVisibility,
      this.deleted,
      this.isDirty,
      this.length,
      this.moduleDefId,
      this.portalId,
      this.propertyCategory,
      this.propertyDefinitionId,
      this.propertyName,
      this.propertyValue,
      this.readOnly,
      this.required,
      this.validationExpression,
      this.viewOrder,
      this.visible,
      this.visibility,
      this.createdByUserID,
      this.createdOnDate,
      this.lastModifiedByUserID,
      this.lastModifiedOnDate});

  ProfileProperties.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    defaultValue = json['defaultValue'];
    defaultVisibility = json['defaultVisibility'];
    deleted = json['deleted'];
    isDirty = json['isDirty'];
    length = json['length'];
    moduleDefId = json['moduleDefId'];
    portalId = json['portalId'];
    propertyCategory = json['propertyCategory'];
    propertyDefinitionId = json['propertyDefinitionId'];
    propertyName = json['propertyName'];
    propertyValue = json['propertyValue'];
    readOnly = json['readOnly'];
    required = json['required'];
    validationExpression = json['validationExpression'];
    viewOrder = json['viewOrder'];
    visible = json['visible'];
    visibility = json['visibility'];
    createdByUserID = json['createdByUserID'];
    createdOnDate = json['createdOnDate'];
    lastModifiedByUserID = json['lastModifiedByUserID'];
    lastModifiedOnDate = json['lastModifiedOnDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataType'] = this.dataType;
    data['defaultValue'] = this.defaultValue;
    data['defaultVisibility'] = this.defaultVisibility;
    data['deleted'] = this.deleted;
    data['isDirty'] = this.isDirty;
    data['length'] = this.length;
    data['moduleDefId'] = this.moduleDefId;
    data['portalId'] = this.portalId;
    data['propertyCategory'] = this.propertyCategory;
    data['propertyDefinitionId'] = this.propertyDefinitionId;
    data['propertyName'] = this.propertyName;
    data['propertyValue'] = this.propertyValue;
    data['readOnly'] = this.readOnly;
    data['required'] = this.required;
    data['validationExpression'] = this.validationExpression;
    data['viewOrder'] = this.viewOrder;
    data['visible'] = this.visible;
    data['visibility'] = this.visibility;
    data['createdByUserID'] = this.createdByUserID;
    data['createdOnDate'] = this.createdOnDate;
    data['lastModifiedByUserID'] = this.lastModifiedByUserID;
    data['lastModifiedOnDate'] = this.lastModifiedOnDate;
    return data;
  }
}
