import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class EmployerProfilePage extends BasePage{
  const EmployerProfilePage({super.key});


  @override
  State<StatefulWidget> createState() => _EmployerProfilePageState();
}

class _EmployerProfilePageState extends BasePageState<EmployerProfilePage>{

  @override
  Widget? getFloatingActionButton(BuildContext context) => FloatingActionButton(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    hoverColor: Colors.blue,
    focusColor: Colors.red,
    foregroundColor: Colors.black,
    backgroundColor: Colors.blue,
    onPressed: () {
      showBottomError("Tính năng đang phát triển");
    },
    child: const Icon(Icons.add,color: Colors.white),
  );
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(
                    width: 40,
                    height: 40,
                    child: ImageLoading(
                        imageUrl: 'https://via.placeholder.com/100',
                        imageBuilder: (context, imageProvider) { // you can access to imageProvider
                          return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                            backgroundImage: imageProvider,
                          );
                        }
                    )
                ),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(GlobalApplication().HelloUser(),style: AppTextStyle.labelTitleBold.copyWith(fontSize: 12,)),
                          Text(GlobalApplication().HelloMessage(),style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.black26),),
                        ],
                      ),
                    )
                )
              ],
            )
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(Icons.newspaper),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Danh sách việc làm đã đăng tuyển",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5
            ),
            itemBuilder: (BuildContext context, int index) {
              int _page = index~/ApplicationConstant.URL_NEW.length;
              int _index = index - (_page*ApplicationConstant.URL_NEW.length);
              return ImageLoading(
                  imageUrl: ApplicationConstant.URL_NEW[_index],
                  imageBuilder: (context, imageProvider)
                  {
                    return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      child: Image(image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
              );
            },
          ),
        ),
      ],
    ),
  );


}