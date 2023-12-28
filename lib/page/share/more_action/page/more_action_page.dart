//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/about_us/page/about_us_page.dart';
import 'package:eportal/page/share/album/page/album_page.dart';
import 'package:eportal/page/share/change_user_info/page/change_user_info_page.dart';
import 'package:eportal/page/share/map/page/map_page.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_item.dart';
import 'package:eportal/page/share/policy/page/policy_page.dart';
import 'package:eportal/page/share/question_answer/page/question_answer_page.dart';
import 'package:eportal/page/share/request_support/page/request_support_page.dart';
import 'package:eportal/page/share/rule/page/rule_page.dart';
import 'package:eportal/screen/share/change_password/page/change_password_page.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../../application/global_application.dart';
import '../../../../enum/role_type.dart';
import '../../../base/page_widget/base_page_widget.dart';
import '../../support/page/support_page.dart';
import '../../video/page/video_page.dart';

class MoreActionPage extends BasePageWidget {
  const MoreActionPage({super.key});

  @override
  State<StatefulWidget> createState() => MoreActionPageState();
}

class MoreActionPageState extends BasePageState<MoreActionPage> {
  Map<String, List<MoreActionPageModel>> actions = <String, List<MoreActionPageModel>>{};
  final InAppReview inAppReview = InAppReview.instance;

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }
  @override
  void initBloc() {
    // TODO: implement initBloc
    actions.clear();
    if(GlobalApplication().roleType == RoleType.bussiness){
      actions.putIfAbsent(
          "Doanh nghiệp",
              () => [
            MoreActionPageModel(
                icon: Icons.change_circle_outlined,
                title: "Đổi thông tin",
                function: () => nextPage((context) => const ChangeUserInfoPage())),
            MoreActionPageModel(
                icon: Icons.password_sharp,
                title: "Đổi mật khẩu",
                function: () => nextPage((context) => const ChangeUserInfoPage())),
          ]);
    }

    actions.putIfAbsent(
        "Tài khoản",
            () => [
          MoreActionPageModel(
              icon: Icons.change_circle_outlined,
              title: "Đổi thông tin",
              function: () => nextPage((context) => const ChangeUserInfoPage())),
          MoreActionPageModel(
              icon: Icons.password_sharp,
              title: "Đổi mật khẩu",
              function: () => nextPage((context) => const ChangeUserInfoPage())),
        ]);
    actions.putIfAbsent(
        "Đa phương tiện",
            () => [
          MoreActionPageModel(
              icon: Icons.video_collection,
              title: "Video",
              function: () => nextPage((context) => const VideoPage())),
          MoreActionPageModel(
              icon: Icons.image,
              title: "Album",
              function: () => nextPage((context) => const AlbumPage())),
        ]);
    actions.putIfAbsent(
        "Biểu đồ",
            () => [
          MoreActionPageModel(
              icon: Icons.area_chart,
              title: "Biểu đồ 1",
              function: () => nextPage((context) => const ChangeUserInfoPage())),
              MoreActionPageModel(
                  icon: Icons.bar_chart,
                  title: "Biểu đồ 2",
                  function: () => nextPage((context) => const ChangeUserInfoPage())),
              MoreActionPageModel(
                  icon: Icons.pie_chart,
                  title: "Biểu đồ 3",
                  function: () => nextPage((context) => const ChangeUserInfoPage())),
              MoreActionPageModel(
                  icon: Icons.bubble_chart,
                  title: "Biểu đồ 4",
                  function: () => nextPage((context) => const ChangeUserInfoPage())),
              MoreActionPageModel(
                  icon: Icons.multiline_chart,
                  title: "Biểu đồ 5",
                  function: () => nextPage((context) => const ChangeUserInfoPage())),
        ]);
    actions.putIfAbsent(
        "Ứng dụng",
            () => [
              MoreActionPageModel(
                  icon: Icons.question_answer,
                  title: "Hỏi đáp",
                  function: () => nextPage((context) => const QuestionAnswerPage())),
              MoreActionPageModel(
                  icon: Icons.upload,
                  title: "Gửi yêu cầu hỗ trợ",
                  function: () => nextPage((context) => const RequestSupportPage())),
              MoreActionPageModel(
                  icon: Icons.support_agent,
                  title: "Dịch vụ khách hàng",
                  function: () => nextPage((context) => const SupportPage())),
              MoreActionPageModel(
                  icon: Icons.map,
                  title: "Bản đồ",
                  function: () => nextPage((context) => const MapPage())),
              MoreActionPageModel(
                  icon: Icons.account_tree,
                  title: "Giới thiệu",
                  function: () => nextPage((context) => const AboutUsPage())),
              MoreActionPageModel(
                  icon: Icons.policy,
                  title: "Chính sách",
                  function: () => nextPage((context) => const PolicyPage())),
              MoreActionPageModel(
                  icon: Icons.rule,
                  title: "Quy định",
                  function: () => nextPage((context) => const RulePage())),
              MoreActionPageModel(
                  icon: Icons.share,
                  title: "Chia sẻ",
                  function: () => GlobalApplication().shareApp()),
              MoreActionPageModel(
                  icon: Icons.star_rate,
                  title: "Đánh giá",
                  function: () => inAppReview.isAvailable().then((value) => inAppReview.requestReview()),)
        ]);

  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  Widget pageUI(BuildContext context) => Container(
    margin: const EdgeInsets.all(10),
    child: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (c, index) {
          return GroupMoreActionItem(
            title: actions.keys.elementAt(index),
            items: actions.values.elementAt(index),
            onClickItem: (item) => item.function(),
          );
        }),
  );
}
