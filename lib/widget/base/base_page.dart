import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/extension/string_extension.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../style/app_color.dart';

//
// Created by BlackRose on 11/1/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<StatefulWidget> createState() => BasePageState<BasePage>();
}

class BasePageState<T extends StatefulWidget> extends State<T> {
  GlobalKey<State<T>> localKey = GlobalKey<State<T>>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late ScrollController scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    scrollController = ScrollController();
    initDataLoading();
    // TODO: implement initState
    super.initState();
  }

  void initDataLoading() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
        ),
      ),
    );
  }

  Widget? getEndDrawer(BuildContext context) => null;

  Widget? getDrawer(BuildContext context) => null;

  Widget pageUI(BuildContext context) {
    return const Text("Categories List");
  }

  void hiddenKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> startLoading() async {
    hiddenKeyboard();
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    hiddenKeyboard();
    Navigator.of(context).pop();
  }

  Future<void> showBottomError(String error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        content: Text(error),
      ),
    );
  }

  Future<bool?> showCenterError(String? error) async {
    hiddenKeyboard();
    return Alert(
        context: context,
        type: AlertType.error,
        title: "Thông báo",
        desc: error
            .supportHtml()
            .replaceWhenNullOrWhiteSpace(ApplicationConstant.SYSTEM_ERROR),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
            child: const Text(
              "Tôi đã biết",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  Future<bool?> showCenterMessage(String message) async {
    hiddenKeyboard();
    return Alert(
        context: context,
        type: AlertType.info,
        title: "Thông báo",
        desc: message,
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
            child: const Text(
              "Tôi đã biết",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  PreferredSizeWidget? getAppBar(BuildContext context) => isHasAppBar(context)
      ? AppBar(
          title: Text(
            getPageTitle(context),
            style: AppTextStyle.titleAppbarPage,
          ),
          backgroundColor: AppColor.colorOfIcon,
          automaticallyImplyLeading: getAutomaticallyImplyLeading(context),
        )
      : null;

  Future<void> loadDataDemo() {
    startLoading();
    return Future.delayed(const Duration(milliseconds: 200)).then((value) {
      stopLoading();
      return value;
    });
  }

  bool getAutomaticallyImplyLeading(BuildContext context) => true;

  bool isHasAppBar(BuildContext context) => true;

  String getPageTitle(BuildContext context) => "Thông báo";

  Widget? getFloatingActionButton(BuildContext context) => null;

  Widget? getBottomNavigationBar(BuildContext context) => null;

  double currentPadding(BuildContext context) => 5;

  Color currentBackgroundColor(BuildContext context) => AppColor.colorOfApp;

  bool isValidForm(BuildContext context) => formKey.currentState!.validate();

  bool isValid() => isValidForm(context);

  void backPage() => Navigator.pop(context);

  void nextPage(WidgetBuilder builder) =>
      Navigator.push(context, MaterialPageRoute(builder: builder));

  void nextPageWithoutBack(WidgetBuilder builder) =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: builder));

  Future<void> scrollToEnd() =>
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

  Widget handlerBaseState<K>(BaseState state, BlocWidgetBuilder<K> builder,
      {Widget? initWidget}) {
    if (state is BaseInitial) {
      return initWidget ?? Container();
    } else if (state is BaseLoading) {
      return buildScreenLoading();
    } else if (state is BaseError) {
      return buildScreenError(state.message
          .replaceWhenNullOrWhiteSpace(ApplicationConstant.SYSTEM_ERROR));
    } else if (state is BaseLoaded<K>) {
      return builder(context, state.data);
    } else {
      return buildScreenError(ApplicationConstant.SYSTEM_ERROR);
    }
  }

  Widget buildScreenLoading() => Center(
        child: Container(
            height: 100,
            child: const Center(child: CircularProgressIndicator())),
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
}

class BasePageStateActive<T extends StatefulWidget> extends BasePageState<T>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    initDataLoading();
    // TODO: implement initState
    super.initState();
  }

  void initDataLoading() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: getFloatingActionButton(context),
          bottomNavigationBar: getBottomNavigationBar(context),
        ),
      ),
    );
  }
}

class BaseScreenState<T extends StatefulWidget> extends BasePageState<T> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: pageUI(context),
      ),
    );
  }
}

class BaseScreenStateActive<T extends StatefulWidget>
    extends BasePageStateActive<T> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: pageUI(context),
      ),
    );
  }
}
