import 'package:eportal/widget/button/info_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class PhoneButton extends StatelessWidget {
  String? phone;

  PhoneButton({
    super.key,
    this.phone,
  });

  @override
  Widget build(BuildContext context) => InfoButton(
        onTap: _callPhone,
        icon: Icons.phone,
        text: phone,
      );

  _callPhone() {
    launchUrl(Uri(
        scheme: 'tel',
        path: phone
            .replaceWhenNullOrWhiteSpace()
            .replaceAll(RegExp(r'^[0-9]'), '')));
  }
}
