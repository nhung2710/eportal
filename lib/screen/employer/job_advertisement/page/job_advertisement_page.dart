import 'dart:math';

import 'package:eportal/model/api/request/common_new/data/work_search_data_request.dart';
import 'package:eportal/model/api/request/common_new/work_search_request.dart';
import 'package:eportal/screen/employer/job_advertisement_add/page/job_advertisement_add_page.dart';
import 'package:eportal/screen/share/empty_example/page/empty_example_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/dialog/filter_job_dialog.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/full_data_item/profile_item.dart';
import 'package:eportal/widget/input/search_input.dart';
import 'package:flutter/material.dart';

import '../../job_advertisement_edit/page/job_advertisement_edit_page.dart';

//
// Created by BlackRose on 04/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class JobAdvertisementPage extends BasePage {
  const JobAdvertisementPage({super.key});

  @override
  State<StatefulWidget> createState() => _JobAdvertisementPageState();
}

class _JobAdvertisementPageState
    extends BasePageStateActive<JobAdvertisementPage> {
  TextEditingController textEditingController = TextEditingController();

  WorkSearchRequest request = WorkSearchRequest(obj: WorkSearchDataRequest());

  @override
  bool isHasAppBar(BuildContext context) => false;
  final filterJobDialogKey = GlobalKey<FilterJobDialogState>();
  late FilterJobDialog filterJobDialog = FilterJobDialog(
    key: filterJobDialogKey,
    data: request.obj,
    onPressed: () => initDataLoading(),
  );

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(initNumberGroup: 1, children: [
        ActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            nextPage((context) => JobAdvertisementAddPage());
          },
        ),
      ]);

  @override
  Widget pageUI(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            color: Colors.white,
            child: SearchInput(
              controller: textEditingController,
              maxLength: 50,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (value) => initDataLoading(),
              icon: Icons.search,
              onTap: () {
                initDataLoading();
              },
              onTapFilter: () {
                showDialog(context: context, builder: (_) => filterJobDialog);
              },
              hintText: "Nội dung tìm kiếm",
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Random().nextInt(100) + 1,
                  itemBuilder: (context, index) => ProfileItem(
                        onTap: () {
                          nextPage((context) => JobAdvertisementEditPage());
                        },
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
            ),
          ),
        ],
      );
}
