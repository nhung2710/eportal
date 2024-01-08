
//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//

import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/model/share/default_model_select_item_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/widget/default_button.dart';
import 'package:eportal/page/widget/default_capcha_text_form_field.dart';
import 'package:eportal/page/widget/default_password_form_field.dart';
import 'package:eportal/page/widget/default_select_item_data_response.dart';
import 'package:eportal/page/widget/default_text_form_field.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constant/application_regex_constant.dart';
import '../../../../extension/string_extension.dart';

class RegisterForOnlineQueueNumberPage extends BasePageWidget {

  const RegisterForOnlineQueueNumberPage({super.key});

  @override
  State<StatefulWidget> createState() => RegisterForOnlineQueueNumberPageState();
}

class RegisterForOnlineQueueNumberPageState extends BasePageState<RegisterForOnlineQueueNumberPage> {

  late DangNhapBloc dangNhapBloc;
  DangNhapEvent dangNhapEvent =
  DangNhapEvent(request: DangNhapRequest(obj: DangNhapDataRequest()));
  final TextEditingController hoVaTenController = TextEditingController();
  final TextEditingController dienThoaiController = TextEditingController();
  final TextEditingController emailLienHeController = TextEditingController();

  final List<DefaultModelSelectItemDataResponse<int>> roles = [
    DefaultModelSelectItemDataResponse(item: 1, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 1"),
    DefaultModelSelectItemDataResponse(item: 2, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 2"),
    DefaultModelSelectItemDataResponse(item: 3, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 3"),
    DefaultModelSelectItemDataResponse(item: 4, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 4"),
    DefaultModelSelectItemDataResponse(item: 5, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 5"),
    DefaultModelSelectItemDataResponse(item: 6, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 6"),
    DefaultModelSelectItemDataResponse(item: 7, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 7"),
    DefaultModelSelectItemDataResponse(item: 8, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 8"),
    DefaultModelSelectItemDataResponse(item: 9, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 9"),
    DefaultModelSelectItemDataResponse(item: 10, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 10"),
    DefaultModelSelectItemDataResponse(item: 11, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 11"),
    DefaultModelSelectItemDataResponse(item: 12, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 12"),
    DefaultModelSelectItemDataResponse(item: 13, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 13"),
    DefaultModelSelectItemDataResponse(item: 14, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 14"),
    DefaultModelSelectItemDataResponse(item: 15, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 15"),
    DefaultModelSelectItemDataResponse(item: 16, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 16"),
    DefaultModelSelectItemDataResponse(item: 17, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 17"),
    DefaultModelSelectItemDataResponse(item: 18, text: "Trung tâm dịch vụ việc làm Thành phố Hà Nội 18")
  ];
  DefaultModelSelectItemDataResponse<int>? role;
  @override
  void initDataLoading() {
    callApi();
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    dangNhapBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    dangNhapBloc = DangNhapBloc();
  }

  @override
  PreferredSizeWidget? getAppBar(BuildContext context) => defaultTabBar();
  @override
  Widget pageUI(BuildContext context) => BlocProvider(
    create: (_) => dangNhapBloc,
    child:
    BlocListener<DangNhapBloc, DataSingleState<DangNhapDataResponse>>(
      listener: (BuildContext context, state) {
        handlerActionDataSingleState<DangNhapDataResponse>(state,
                (obj) async {
              showCenterMessage("Bạn đã thay đổi mật khẩu thành công")
                  .then((value) => backPage());
            });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Đăng ký lấy số tự động",
                style: AppTextStyle.titlePage.copyWith(
                    overflow: TextOverflow.visible,
                    fontSize: 18,
                    color: AppColor.colorOfIconActive),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 5),
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 200,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/app.png',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  DefaultSelectItemDataResponse<
                      DefaultModelSelectItemDataResponse<int>>(
                    icon: FontAwesomeIcons.crosshairs,
                    selectedItem: role,
                    hintText: "Nơi nhận",
                    labelText: "Nơi nhận",
                    helperText: "Ví dụ: ${role?.text}",
                    list: roles,
                    itemAsString:
                        (DefaultModelSelectItemDataResponse<int> u) =>
                        u.text.supportHtml(),
                    onChanged:
                        (DefaultModelSelectItemDataResponse<int>? data) {
                      if (role != data) {
                        role = data;
                      }
                    },
                    title: 'Nơi nhận',
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.user,
                    controller: hoVaTenController,
                    hintText: "Họ và tên",
                    labelText: "Họ và tên",
                    helperText: "Ví dụ: Nguyễn Văn A",
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.phone,
                    controller: dienThoaiController,
                    hintText: "Điện thoại",
                    labelText: "Điện thoại",
                    helperText: "Ví dụ: 000000000",
                    regex: ApplicationRegexConstant.kRegexPhone,
                    required: true,
                  ),
                  DefaultTextFormField(
                    icon: FontAwesomeIcons.user,
                    controller: emailLienHeController,
                    hintText: "Email",
                    labelText: "Email",
                    helperText: "Ví dụ: abc@gmail.com",
                    regex: ApplicationRegexConstant.kRegexEmail,
                    required: true,
                  ),
                  DefaultCapchaTextFormField(
                    helperText: "Ví dụ: AAAAAA",
                    onFieldSubmitted: (v) => submitForm(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: DefaultButton(
                      onPressed: () => submitForm(),
                      text: 'Lấy số',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  submitForm() {
    if(isValid()){
      showBaseBottomSheet(children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            alertOption(allow: (){
                processDemo().then((value) => showCenterMessage("Đăng ký lấy số thành công")).then((value) => backPage());
            });
          },
          child: ListTile(
            title: Text(
              "Đăng ký nộp hồ sơ đăng ký hưởng bảo hiểm thất nghiệp",
              style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            alertOption(allow: (){
              processDemo().then((value) => showCenterMessage("Đăng ký lấy số thành công")).then((value) => backPage());

            });
          },
          child: ListTile(
            title: Text(
              "Đăng ký nộp hồ sơ đăng ký hỗ trợ học nghề",
              style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            alertOption(allow: (){
              processDemo().then((value) => showCenterMessage("Đăng ký lấy số thành công")).then((value) => backPage());

            });
          },
          child: ListTile(
            title: Text(
              "Đăng ký nộp hồ sơ đăng ký tư vấn, giới thiệu việc làm",
              style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            alertOption(allow: (){
              processDemo().then((value) => showCenterMessage("Đăng ký lấy số thành công")).then((value) => backPage());

            });
          },
          child: ListTile(
            title: Text(
              "Đăng ký hồ sơ đăng ký thông báo tìm kiếm việc làm",
              style: AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            ),
          ),
        ),
      ]);
    }
  }

  void alertOption({required void Function() allow}){
    showAlertChoose(allow: allow,title: "Thông báo",desc: "Bạn có chắc chắn muốn lấy số không?");
  }

}