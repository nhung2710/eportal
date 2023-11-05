import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 06/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CurriculumVitaeHistoryWorkerPage extends BasePage{
  const CurriculumVitaeHistoryWorkerPage({super.key});


  @override
  State<StatefulWidget> createState() => _CurriculumVitaeHistoryWorkerPageState();
}

class _CurriculumVitaeHistoryWorkerPageState extends BasePageState<CurriculumVitaeHistoryWorkerPage>{
  @override
  Widget pageUI(BuildContext context) => Column(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8,3,8,8),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(50, (index) => Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: Text("Nội dung sửa: test",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: Text("Lý do sửa: test",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: Text("Thời gian sửa: 06/11/2023",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                    ),


                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    ],
  );

  _addCurriculumVitae(BuildContext context) {

  }

  _openHistoryCurriculumVitae(BuildContext context) {

  }

  _addCurriculumVitaeReferences(BuildContext context) {}


}