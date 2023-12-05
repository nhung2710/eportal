import 'dart:math';

import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/full_data_item/profile_item.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ChangeBusinessInfoAccountTab extends BasePage {
  const ChangeBusinessInfoAccountTab({super.key});

  @override
  State<StatefulWidget> createState() => ChangeBusinessInfoAccountTabState();
}

class ChangeBusinessInfoAccountTabState
    extends BaseScreenStateActive<ChangeBusinessInfoAccountTab> {
  TextEditingController educationController = TextEditingController();

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Random().nextInt(100) + 1,
            itemBuilder: (context, index) => ProfileItem(
                  onTap: () {},
                  title: "Hồ sơ ${index + 1}",
                  location: "Hà nội",
                  status: "Chờ duyệt",
                  experience: "Dưới 1 năm",
                  salary: "5-7 triệu",
                  fromDate: "01/11/2023",
                  toDate: "01/11/2023",
                  industry: "Bán hàng",
                  numberView: "2",
                  isShowFull: true,
                )),
      );
}
