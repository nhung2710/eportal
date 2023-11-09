import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//
// Created by BlackRose on 11/9/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ProfilePage extends BasePage{
  const ProfilePage({super.key});


  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageStateActive<ProfilePage>{

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget? getFloatingActionButton(BuildContext context) => ExpandableFab(
      initNumberGroup: 3,
      children: [
        ActionButton(
          icon: const Icon(Icons.app_registration, color: Colors.white),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.app_registration, color: Colors.white),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.app_registration, color: Colors.white),
          onPressed: () {
            loadDataDemo().then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
      ]);
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Thông tin hồ sơ của bạn",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Người tham khảo",maxLines: 1,textAlign: TextAlign.start,style: AppTextStyle.titlePage,),
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.normal,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.normal),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ],
    ),
  );

}