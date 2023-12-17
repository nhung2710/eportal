import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/enum/data_bloc_status.dart';
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

typedef CallbackListener<T> = void Function(T? obj);

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<StatefulWidget> createState() => BasePageState<BasePage>();
}

class BasePageState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  GlobalKey<State<T>> localKey = GlobalKey<State<T>>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DialogRoute? loaddingDialog;
  ScrollController? scrollController;
  bool isScrollMore = true;

  @override
  void dispose() {
    scrollController?.removeListener(_onScroll);
    scrollController?.dispose();
    scrollController = null;
    //WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.offset;
    if (currentScroll >= (maxScroll * 0.5) && isScrollMore) {
      stopScrollMore();
      getMoreData();
    }
  }

  void startScrollMore() {
    isScrollMore = true;
  }

  void stopScrollMore() {
    isScrollMore = false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("$runtimeType app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("$runtimeType app in inactive");
        break;
      case AppLifecycleState.paused:
        print("$runtimeType app in paused");
        break;
      case AppLifecycleState.detached:
        print("$runtimeType app in detached");
        break;
      case AppLifecycleState.hidden:
        print("$runtimeType app in hidden");
        break;
    }
  }

  void getMoreData() {}

  @override
  void initState() {
    //WidgetsBinding.instance.addObserver(this);
    startScrollMore();
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);
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

  void callApi() {}

  void initDataLoading() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
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

  late SimpleDialog simpleDialog;

  Future<void> startLoading() async {
    hiddenKeyboard();
    loaddingDialog = DialogRoute(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => simpleDialog);
    if (loaddingDialog != null) {
      Navigator.of(context).push(loaddingDialog!);
    }
  }

  Future<void> stopLoading() async {
    hiddenKeyboard();
    if (loaddingDialog != null) {
      Navigator.of(context).removeRoute(loaddingDialog!);
      loaddingDialog = null;
    }
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
              Color.fromRGBO(52, 138, 199, 1.0),
              AppColor.colorOfIcon,
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
              Color.fromRGBO(52, 138, 199, 1.0),
              AppColor.colorOfIcon
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

  Future nextPage(WidgetBuilder builder) {
    stopLoading();
    return Navigator.push(context, MaterialPageRoute(builder: builder));
  }

  void nextPageWithoutBack(WidgetBuilder builder) {
    stopLoading();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: builder));
  }

  Future<void> scrollToEnd() =>
      scrollController!.animateTo(scrollController!.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

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
          if (!state.hasReachedMax) {
            startScrollMore();
          }
          return builder(context, state.data);
        }
    }
  }

  void handlerActionDataSingleState<T>(
      DataSingleState<T> state, CallbackListener<T> callback) {
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

  Widget buildScreenLoading(BuildContext buildContext) => Center(
        child: Image.asset("assets/images/loading.gif"),
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

  void initBloc() {}
}

class BasePageStateActive<T extends StatefulWidget> extends BasePageState<T>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: formKey,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
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
