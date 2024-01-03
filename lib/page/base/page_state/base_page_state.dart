//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/custom/custom_page_route_builder.dart';
import 'package:eportal/enum/data_bloc_status.dart';
import 'package:eportal/extension/error_extension.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../extension/string_extension.dart';

typedef CallbackHandle<T> = void Function(T? obj);

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  GlobalKey<State<T>> localKey = GlobalKey<State<T>>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController scrollController;
  bool isScrollMore = true;

  void callApi();

  void initBloc();

  void disposeBloc();

  void initDataLoading();

  void getMoreData();

  @override
  void dispose() {
    ErrorExtension().handleActionError(() {
      scrollController.removeListener(_onScroll);
      scrollController.dispose();
    });
    ErrorExtension().handleActionError(() {
      disposeBloc();
    });
    super.dispose();
  }

  void _onScroll() {
    ErrorExtension().handleActionError(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.offset;
      if (currentScroll >= (maxScroll * 0.8) && isScrollMore) {
        stopScrollMore();
        showBottomError("Đang tải trang tiếp theo");
        getMoreData();
      }
    });
  }

  void startScrollMore() {
    isScrollMore = true;
  }

  void stopScrollMore() {
    isScrollMore = false;
  }

  PreferredSizeWidget defaultTabBar() => AppBar(
        title: Text(
          getPageTitle(context),
          style: AppTextStyle.titleAppbarPage,
        ),
        backgroundColor: AppColor.colorOfIcon,
        automaticallyImplyLeading: true,
        centerTitle: true,
      );

  @override
  void initState() {
    print("initState: ${runtimeType}");
    //WidgetsBinding.instance.addObserver(this);
    startScrollMore();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    simpleDialog = SimpleDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      // can change this to your prefered color
      children: <Widget>[
        Center(
          child: SizedBox(
            height: 100,
            child: buildScreenLoading(context),
          ),
        )
      ],
    );
    initBloc();
    initDataLoading();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: true,
          backgroundColor: getBackgroundColor(context),
          appBar: getAppBar(context),
          body: Container(
            color: currentBackgroundColor(context),
            height: double.infinity,
            padding: EdgeInsets.all(currentPadding(context)),
            child: RefreshIndicator(
                color: AppColor.colorOfIcon,
                onRefresh: () async => initDataLoading(),
                child: pageUI(context)),
          ),
          endDrawer: getEndDrawer(context),
          drawer: getDrawer(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: getFloatingActionButton(context),
          bottomNavigationBar: getBottomNavigationBar(context),
          bottomSheet: getBottomSheet(context),
        ),
      ),
    );
  }

  Widget? getEndDrawer(BuildContext context) => null;

  Widget? getDrawer(BuildContext context) => null;

  Widget pageUI(BuildContext context);

  Future processDemo() => startLoading()
      .then((value) => Future.delayed(const Duration(seconds: 5)))
      .then((value) => stopLoading());

  void hiddenKeyboard() {
    ErrorExtension()
        .handleActionError(() => FocusManager.instance.primaryFocus?.unfocus());
  }

  late SimpleDialog simpleDialog;

  Future<void> startLoading() async {
    hiddenKeyboard();
    EasyLoading.show(
        status: 'Hệ thông đang xử lý...', maskType: EasyLoadingMaskType.clear);
  }

  Future<void> stopLoading() async {
    hiddenKeyboard();
    EasyLoading.dismiss();
  }

  Future<void> showBottomError(String error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 500),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        content: Text(
          error,
          style: AppTextStyle.textButton.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future showBaseBottomSheet({required List<Widget> children}){
    return showModalBottomSheet(
        context: context,
        elevation: AppElevation.sizeOfNormal,
        useSafeArea: true,
        backgroundColor: Colors.white,
        builder: (context) => Container(
          padding: const EdgeInsets.only(top: 10),
          child: Wrap(
            children: children,
          ),
        ));
  }

  void copyText({required String text}){
    Clipboard.setData(ClipboardData(text: text));
  }


  Future<bool?> showAlertChoose(
      {Widget content = const SizedBox(),
      String? title,
      String? desc,
      required void Function() allow}) async {
    hiddenKeyboard();
    return Alert(
        context: context,
        type: AlertType.warning,
        style: AlertStyle(
            titleStyle:
                AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            descStyle:
                AppTextStyle.normal.copyWith(overflow: TextOverflow.visible)),
        title: title,
        desc: desc,
        content: content,
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
            radius: const BorderRadius.all(Radius.circular(5)),
            child: Text(
              "Huỷ",
              style: AppTextStyle.textButton.copyWith(color: Colors.white),
            ),
          ),
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
              allow();
            },
            radius: const BorderRadius.all(Radius.circular(5)),
            color: AppColor.colorOfIcon,
            child: Text(
              "Tiếp tục",
              style: AppTextStyle.textButton.copyWith(color: Colors.white),
            ),
          )
        ]).show();
  }

  Future<bool?> showCenterError(String? error) async {
    hiddenKeyboard();
    return Alert(
        context: context,
        type: AlertType.error,
        style: AlertStyle(
            titleStyle:
                AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            descStyle:
                AppTextStyle.normal.copyWith(overflow: TextOverflow.visible)),
        title: "Thông báo",
        desc: error
            .supportHtml()
            .replaceWhenNullOrWhiteSpace(ApplicationConstant.SYSTEM_ERROR),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            radius: const BorderRadius.all(Radius.circular(5)),
            color: AppColor.colorOfIcon,
            child: Text(
              "Tôi đã biết",
              style: AppTextStyle.textButton.copyWith(color: Colors.white),
            ),
          )
        ]).show();
  }

  Future<bool?> showCenterMessage(String message) async {
    hiddenKeyboard();
    return Alert(
        context: context,
        type: AlertType.info,
        style: AlertStyle(
            titleStyle:
                AppTextStyle.title.copyWith(overflow: TextOverflow.visible),
            descStyle:
                AppTextStyle.normal.copyWith(overflow: TextOverflow.visible)),
        title: "Thông báo",
        desc: message,
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            radius: const BorderRadius.all(Radius.circular(5)),
            color: AppColor.colorOfIcon,
            child: Text(
              "Tôi đã biết",
              style: AppTextStyle.textButton.copyWith(color: Colors.white),
            ),
          )
        ]).show();
  }

  PreferredSizeWidget? getAppBar(BuildContext context) => null;

  String getPageTitle(BuildContext context) => "";

  Widget? getFloatingActionButton(BuildContext context) => null;

  Widget? getBottomNavigationBar(BuildContext context) => null;

  double currentPadding(BuildContext context) => 0;

  Color currentBackgroundColor(BuildContext context) => AppColor.colorOfApp;

  bool isValidForm(BuildContext context) => formKey.currentState!.validate();

  bool isValid() => isValidForm(context);

  void backPage([Object? result]) => Navigator.pop(context, result);

  Future nextPage(WidgetBuilder builder) {
    stopLoading();
    return Navigator.push(context, MaterialPageRoute(builder: builder));
  }

  Future nextPageWithoutBack(WidgetBuilder builder) {
    stopLoading();
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: builder));
  }
  /*Future nextPage(WidgetBuilder builder) {
    stopLoading();
    return Navigator.push(context,
        CustomPageRouteBuilder(exitPage: widget, enterPage: builder(context)));
  }

  Future nextPageWithoutBack(WidgetBuilder builder) {
    stopLoading();
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: builder));
  }*/

  Future<void> scrollToEnd() =>
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 0), curve: Curves.easeOut);

  Widget handleDataSingleState<T>(
      DataSingleState<T> state, BlocWidgetBuilder<T?> builder,
      {Widget? initWidget}) {
    switch (state.status) {
      case DataBlocStatus.init:
        return initWidget ?? Container();
      case DataBlocStatus.loading:
        return buildScreenLoading(context);
      case DataBlocStatus.notFoundData:
        return buildNotFoundData(context);
      case DataBlocStatus.error:
        return buildScreenError(state.errorMessage);
      case DataBlocStatus.success:
        return builder(context, state.data);
    }
  }

  Widget handleDataMultiState<T>(
      DataMultiState<T> state, BlocWidgetBuilder<List<T>> builder,
      {Widget? initWidget}) {
    switch (state.status) {
      case DataBlocStatus.init:
        return initWidget ?? Container();
      case DataBlocStatus.loading:
        return buildScreenLoading(context);
      case DataBlocStatus.notFoundData:
        return buildNotFoundData(context);
      case DataBlocStatus.error:
        return buildNotFoundData(context);
      case DataBlocStatus.success:
        return builder(context, state.data);
    }
  }

  Widget handleSelectDataMultiState<T>(
    DataMultiState<T> state,
    BlocWidgetBuilder<List<T>> builder,
  ) {
    switch (state.status) {
      case DataBlocStatus.init:
        return buildSelectLoading(context);
      case DataBlocStatus.loading:
        return buildSelectLoading(context);
      case DataBlocStatus.notFoundData:
        return buildSelectLoading(context);
      case DataBlocStatus.error:
        return buildSelectLoading(context);
      case DataBlocStatus.success:
        return builder(context, state.data);
    }
  }

  Widget handleDataPageState<T>(
      DataPageState<T> state, BlocWidgetBuilder<List<T>> builder,
      {Widget? initWidget}) {
    switch (state.status) {
      case DataBlocStatus.init:
        return initWidget ?? Container();
      case DataBlocStatus.loading:
        return buildScreenLoading(context);
      case DataBlocStatus.notFoundData:
        return buildNotFoundData(context);
      case DataBlocStatus.error:
        return buildScreenError(state.errorMessage);
      case DataBlocStatus.success:
        {
          var result = builder(context, state.data);
          if (!state.hasReachedMax) {
            startScrollMore();
          }
          return result;
        }
    }
  }

  void handlerActionDataSingleState<T>(
      DataSingleState<T> state, CallbackHandle<T> callback) {
    switch (state.status) {
      case DataBlocStatus.init:
        break;
      case DataBlocStatus.loading:
        startLoading();
        break;
      case DataBlocStatus.notFoundData:
        stopLoading();
        break;
      case DataBlocStatus.error:
        stopLoading();
        showCenterError(state.errorMessage);
        break;
      case DataBlocStatus.success:
        stopLoading();
        return callback(state.data);
    }
  }

  Widget buildScreenLoading(BuildContext buildContext) => const Center(
      child: RefreshProgressIndicator(
      )
  );

  Widget buildScreenError(String error) => Container(
      height: 100,
      child: Text(
        error,
        style: AppTextStyle.title.copyWith(color: Colors.red),
      ));

  Widget buildNotFoundData(BuildContext buildContext) => Center(
        child: Image.asset("assets/images/NotFoundData.jpg"),
      );

  Widget buildImplement(BuildContext buildContext) => Center(
        child: Image.asset("assets/images/Implement.jpg"),
      );

  Widget buildSelectLoading(BuildContext context) => const SizedBox(
        height: 25,
        child: CircularProgressIndicator(
          color: AppColor.colorOfIcon,
          strokeWidth: 5,
        ),
      );

  Color getBackgroundColor(BuildContext context) => Colors.transparent;

  Widget? getBottomSheet(BuildContext context) => null;

}
