//
// Created by BlackRose on 02/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/style/app_color.dart';
import 'package:flutter/material.dart';

abstract class BasePageKeepState<T extends StatefulWidget> extends BasePageState<T> with AutomaticKeepAliveClientMixin{

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
        ),
      ),
    );
  }
}
