import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/dashboard/page/dashboard_page.dart';
import 'package:eportal/screen/login/page/login_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class SettingWorkerPage extends BasePage{
  const SettingWorkerPage({super.key});


  @override
  State<StatefulWidget> createState() => _SettingWorkerPageState();
}

class _SettingWorkerPageState extends BasePageState<SettingWorkerPage>{
  @override
  Widget pageUI(BuildContext context) =>Column(
    children: [
      GlobalApplication().IsLogin ? Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          height: 60,
          child: Row(
            children: [
              ImageLoading(
                imageUrl: 'https://via.placeholder.com/100',
                imageBuilder: (context, imageProvider) { // you can access to imageProvider
                  return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                    backgroundImage: imageProvider,
                  );
                },
              )
              ,
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                    child: Text(GlobalApplication().HelloUser()),
                  )
              )
            ],
          )
      ) : Container(
          height: 50,
          color: Colors.white,
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Đăng nhập'),
            onPressed: () => _signInAsync(context),
          )
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 4,
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: ApplicationConstant.SETTING_MENU.map((item) {
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.account_circle_outlined,color: Colors.grey,),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 10,left: 10),
                                    child: Text("$item",textAlign: TextAlign.start,style: AppTextStyle.labelTitle.copyWith(color:Colors.blue))
                                ),
                              ),
                              const FaIcon(FontAwesomeIcons.angleRight,size: 20)
                            ],
                          )
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      GlobalApplication().IsLogin ? Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10,bottom: 10),
          child: ElevatedButton(
            child: const Text('Đăng xuất'),
            onPressed: () => _signOutAsync(context),
          )
      ) : Container()
    ],
  );

  _signInAsync(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));

  }

  _signOutAsync(BuildContext context) {
    GlobalApplication().SignOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const DashboardPage()));
  }

}