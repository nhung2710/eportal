//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ApplicationRegexConstant {
  ApplicationRegexConstant._internal();

  static const String kRegexEmail =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  static const String kRegexPhone =
      r"^(84|0[3|5|7|8|9])+([0-9]{8})$";
}
