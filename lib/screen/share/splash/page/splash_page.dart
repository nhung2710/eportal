import 'package:eportal/application/global_application.dart';
import 'package:eportal/bloc/common_new/dang_nhap_bloc.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/enum/role_type.dart';
import 'package:eportal/event/common_new/dang_nhap_event.dart';
import 'package:eportal/model/api/request/common_new/dang_nhap_request.dart';
import 'package:eportal/model/api/request/common_new/data/dang_nhap_data_request.dart';
import 'package:eportal/model/api/response/common_new/data/dang_nhap_data_response.dart';
import 'package:eportal/screen/share/forgot_password/page/forgot_password_page.dart';
import 'package:eportal/screen/share/sign_up/page/sign_up_page.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/input/field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eportal/screen/admin/home/home_page.dart' as admin;
import 'package:eportal/screen/employer/home/home_page.dart' as employer;
import 'package:eportal/screen/worker//home/home_page.dart' as worker;
import 'package:eportal/screen/anonymous/home/home_page.dart' as anonymous;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../extension/string_extension.dart';
import '../../../../style/app_text_style.dart';

//
// Created by BlackRose on 30/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SplashPage extends BasePage {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage>
    with TickerProviderStateMixin {
  DangNhapBloc dangNhapBloc = DangNhapBloc();
  double currentData = 0;

  @override
  double currentPadding(BuildContext context) => 10;

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  void initDataLoading() {
    loaddingDataDefault();
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) {
    return BlocProvider(
      create: (_) => dangNhapBloc,
      child: BlocListener<DangNhapBloc, DataSingleState<DangNhapDataResponse>>(
        listener: (context, state) {
          switch (state.status) {
            case DataBlocStatus.init:
              break;
            case DataBlocStatus.loading:
              break;
            case DataBlocStatus.notfound:
              _skipPage(context);
              break;
            case DataBlocStatus.error:
              _skipPage(context);
              break;
            case DataBlocStatus.success:
              return handlerActionDataLogin(state.data);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 150,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/Logo.jpg',
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Đang tải dữ liệu ${(currentData * 100).toInt()}%",
                    style: AppTextStyle.titlePage
                        .copyWith(color: AppColor.colorOfIcon),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: LinearProgressIndicator(
                  minHeight: 15,
                  color: AppColor.colorOfIcon,
                  backgroundColor: Colors.grey,
                  value: currentData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _skipPage(BuildContext context) {
    endPercent();
    nextPageWithoutBack((context) => const anonymous.HomePage());
  }

  addPercent(double value) {
    setState(() {
      currentData += value;
    });
  }

  endPercent() {
    setState(() {
      currentData = 1;
    });
  }

  Future<void> loaddingDataDefault() {
    return Future.wait([
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]).then((value) => addPercent(0.15)),
      getApplicationDocumentsDirectory().then((value) {
        GlobalApplication().dirPath = value.path;
        addPercent(0.15);
      }),
      SharedPreferences.getInstance().then((value) {
        GlobalApplication().preferences = value;
        addPercent(0.15);
      })
    ])
        .then((value) {
          GlobalApplication().userNameSaved = (GlobalApplication()
                  .preferences!
                  .getString(ApplicationConstant.USER_NAME))
              .replaceWhenNullOrWhiteSpace();
          GlobalApplication().userPasswordSaved = (GlobalApplication()
                  .preferences!
                  .getString(ApplicationConstant.USER_PASSWORD))
              .replaceWhenNullOrWhiteSpace();
          addPercent(0.15);
        })
        .then((_) => checkAppRunFirstTime())
        .then((isFirstRunApp) {
          addPercent(0.15);
          if (GlobalApplication().userNameSaved.isNullOrWhiteSpace() ||
              GlobalApplication().userPasswordSaved.isNullOrWhiteSpace()) {
            _skipPage(context);
          } else {
            dangNhapBloc.add(DangNhapEvent(
                request: DangNhapRequest(
                    obj: DangNhapDataRequest(
                        userName: GlobalApplication().userNameSaved,
                        passWord: GlobalApplication().userPasswordSaved))));
          }
        });
  }

  Future<bool> checkAppRunFirstTime() async {
    bool? isFirstRunApp = GlobalApplication()
        .preferences
        ?.getBool(ApplicationConstant.FIRST_TIME_OPEN_APP);
    await GlobalApplication()
        .preferences
        ?.setBool(ApplicationConstant.FIRST_TIME_OPEN_APP, false);
    addPercent(0.15);
    return isFirstRunApp ?? true;
  }

  void handlerActionDataLogin(DangNhapDataResponse? data) {
    endPercent();
    GlobalApplication()
        .signIn(data, GlobalApplication().userNameSaved,
            GlobalApplication().userPasswordSaved)
        .then((value) {
      switch (GlobalApplication().roleType) {
        case RoleType.users:
          nextPageWithoutBack((context) => const worker.HomePage());
          break;
        case RoleType.bussiness:
          nextPageWithoutBack((context) => const employer.HomePage());
          break;
        case RoleType.cms:
          nextPageWithoutBack((context) => const admin.HomePage());
          break;
        case RoleType.anonymous:
          _skipPage(context);
          break;
      }
    });
  }
}
