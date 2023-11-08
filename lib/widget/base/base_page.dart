import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  final formKey = GlobalKey<FormState>();

  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
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
            child: pageUI(context),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: getFloatingActionButton(context),
          bottomNavigationBar: getBottomNavigationBar(context),
        ),
      ),
    );
  }
  Widget pageUI(BuildContext context){
     return const Text("Categories List");
  }
  void hiddenKeyboard(){
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
          backgroundColor: Colors.transparent, // can change this to your prefered color
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

  Future<bool?> showCenterError(String error) async {
    hiddenKeyboard();
    return Alert(context: context,
        type: AlertType.error,
        title: "Thông báo",
        desc: error,
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
        ]
    ).show();
  }
  Future<bool?> showCenterMessage(String message) async {
    hiddenKeyboard();
    return Alert(context: context,
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
        ]
    ).show();
  }
  PreferredSizeWidget? getAppBar(BuildContext context) => isHasAppBar(context) ?  AppBar(
    title: Text(getPageTitle(context),style: AppTextStyle.titleAppbarPage,),
    automaticallyImplyLeading: getAutomaticallyImplyLeading(context),
  ) : null;
  Future<void> loadDataDemo(){
    startLoading();
    return Future.delayed(const Duration(milliseconds: 200))
      .then((value){
      stopLoading();
      return value;
    });
  }

  bool getAutomaticallyImplyLeading(BuildContext context) => true;
  bool isHasAppBar(BuildContext context) => true;
  String getPageTitle(BuildContext context) => "Thông báo";

  Widget? getFloatingActionButton(BuildContext context)  => null;

  Widget? getBottomNavigationBar(BuildContext context) => null;
  double currentPadding(BuildContext context) => 5;
  Color currentBackgroundColor(BuildContext context) => Colors.black12;
  bool isValidForm(BuildContext context) => formKey.currentState!.validate();
  bool isValid() => isValidForm(context);
  void backPage() => Navigator.pop(context);
  void nextPage(WidgetBuilder builder)=> Navigator.push(context,MaterialPageRoute(builder: builder));
  void nextPageWithoutBack(WidgetBuilder builder)=> Navigator.pushReplacement(context,MaterialPageRoute(builder: builder));
  Future<void> scrollToEnd() => scrollController.animateTo(scrollController.position.maxScrollExtent,duration: const Duration(milliseconds: 300),curve: Curves.easeOut);
}

class BasePageStateActive<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin {
  final formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;

  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
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
            child: pageUI(context),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: getFloatingActionButton(context),
          bottomNavigationBar: getBottomNavigationBar(context),
        ),
      ),
    );
  }
  Widget pageUI(BuildContext context){
    return const Text("Categories List");
  }
  void hiddenKeyboard(){
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
          backgroundColor: Colors.transparent, // can change this to your prefered color
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

  Future<bool?> showCenterError(String error) async {
    hiddenKeyboard();
    return Alert(context: context,
        type: AlertType.error,
        title: "Thông báo",
        desc: error,
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
        ]
    ).show();
  }
  Future<bool?> showCenterMessage(String message) async {
    hiddenKeyboard();
    return Alert(context: context,
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
        ]
    ).show();
  }
  PreferredSizeWidget? getAppBar(BuildContext context) => isHasAppBar(context) ?  AppBar(
    title: Text(getPageTitle(context)),
    automaticallyImplyLeading: getAutomaticallyImplyLeading(context),
  ) : null;
  Future<void> loadDataDemo(){
    startLoading();
    return Future.delayed(const Duration(milliseconds: 200))
        .then((value){
      stopLoading();
      return value;
    });
  }

  bool getAutomaticallyImplyLeading(BuildContext context) => true;
  bool isHasAppBar(BuildContext context) => true;
  String getPageTitle(BuildContext context) => "Thông báo";

  Widget? getFloatingActionButton(BuildContext context)  => null;

  Widget? getBottomNavigationBar(BuildContext context) => null;
  double currentPadding(BuildContext context) => 5;
  Color currentBackgroundColor(BuildContext context) => Colors.black12;
  bool isValidForm(BuildContext context) => formKey.currentState!.validate();
  bool isValid() => isValidForm(context);
  void backPage() => Navigator.pop(context);
  void nextPage(WidgetBuilder builder)=> Navigator.push(context,MaterialPageRoute(builder: builder));
  void nextPageWithoutBack(WidgetBuilder builder)=> Navigator.pushReplacement(context,MaterialPageRoute(builder: builder));
  Future<void> scrollToEnd() => scrollController.animateTo(scrollController.position.maxScrollExtent,duration: const Duration(milliseconds: 300),curve: Curves.easeOut);
}
