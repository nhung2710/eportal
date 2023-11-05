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
  @override
  Widget build(BuildContext context){
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: currentBackgroundColor(),
          height: double.infinity,
          padding: EdgeInsets.all(currentPadding()),
          child: pageUI(context),
        )
      ),
    );
  }
  double currentPadding() => 5;
  Color currentBackgroundColor() => Colors.black12;
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
}