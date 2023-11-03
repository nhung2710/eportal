

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class QuestionAndAnswerPage extends BasePage{
  const QuestionAndAnswerPage({super.key});


  @override
  State<StatefulWidget> createState() => _QuestionAndAnswerPageState();
}

class _QuestionAndAnswerPageState extends BasePageState<QuestionAndAnswerPage>{
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget pageUI(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(8,0,8,0),
    color: Colors.black12,
    height: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  Icon(Icons.question_answer),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Hỏi và đáp",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 50,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Card(
                      child: GridTile(
                       header: Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Center(child: Text("Thông báo số ${index+1}",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 14))),
                       ),
                        footer: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: Text("Nội dung số ${index+1}",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 10),)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                              child: ImageLoading(
                                  imageUrl: ApplicationConstant.URL_NEWS,
                                  imageBuilder: (context, imageProvider)
                                  {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                      child: Image(image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                              )
                          ),
                        ),
                      ),
                    ),
                  );
                },
            ),
          )

        ],
      ),
    ),
  );

}