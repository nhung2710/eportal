import 'package:eportal/widget/button/info_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//
// Created by BlackRose on 21/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class EmailButton extends StatelessWidget {
  String? email;

  EmailButton({
    super.key,
    this.email,
  });

  @override
  Widget build(BuildContext context) => InfoButton(
        onTap: _sendEmail,
        icon: Icons.email,
        text: email,
      );

  _sendEmail() {
    launchUrl(Uri(
      scheme: 'mailto',
      path: '$email',
      query: 'subject=Yêu cầu hỗ trợ',
    ));
  }
}
