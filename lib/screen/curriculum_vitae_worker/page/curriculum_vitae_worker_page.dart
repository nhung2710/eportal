import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/curriculum_vitae_add_worker/page/curriculum_vitae_add_worker_page.dart';
import 'package:eportal/screen/curriculum_vitae_add_worker_references/page/curriculum_vitae_add_worker_references_page.dart';
import 'package:eportal/screen/curriculum_vitae_edit_worker/page/curriculum_vitae_edit_worker_page.dart';
import 'package:eportal/screen/curriculum_vitae_history_worker/page/curriculum_vitae_history_worker_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CurriculumVitaeWorkerPage extends BasePage{
  const CurriculumVitaeWorkerPage({super.key});


  @override
  State<StatefulWidget> createState() => _CurriculumVitaeWorkerPageState();
}

class _CurriculumVitaeWorkerPageState extends BasePageState<CurriculumVitaeWorkerPage>{
  @override
  Widget pageUI(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
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
                  Icon(Icons.account_circle_rounded),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Text("Thông tin hồ sơ của bạn",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                    ),
                  ),
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
                            child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.labelTitle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.labelTitle),
                          ),

                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => _editCurriculumVitae(context),
                      icon: const Icon(Icons.mode_edit_sharp,color: Colors.blue,)
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
                  Icon(Icons.account_circle_rounded),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Text("Người tham khảo",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                    ),
                  ),
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
                            child: Text("Họ và tên : Trần Hữu Tùng",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Tuổi : 30",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Quên quán : Hà Nam",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Số điện thoại : 0386110030",textAlign: TextAlign.start,style: AppTextStyle.labelTitle,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Địa chỉ email : tranhuutung92@gmail.com",textAlign: TextAlign.start,style: AppTextStyle.labelTitle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Công việc tìm kiếm : code dạo",textAlign: TextAlign.start,style: AppTextStyle.labelTitle),
                          ),

                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => _editCurriculumVitaeReferences(context),
                      icon: const Icon(Icons.mode_edit_sharp,color: Colors.blue,)
                  )
                ],
              )
          ),
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    floatingActionButton: ExpandableFab(
        distance: 120,
        children: [
          ActionButton(
            icon: const Icon(Icons.insert_drive_file, color: Colors.white,),
            onPressed: () => _addCurriculumVitae(context),
          ),
          ActionButton(
            icon: const Icon(Icons.supervisor_account, color: Colors.white,),
            onPressed: () => _addCurriculumVitaeReferences(context),
          ),
          ActionButton(
            icon: const Icon(Icons.history, color: Colors.white,),
            onPressed: () => _openHistoryCurriculumVitae(context),
          ),
        ]),
  );

  _addCurriculumVitae(BuildContext context) {

    Navigator.push(context,MaterialPageRoute(builder: (context) => const CurriculumVitaeAddWorkerPage()));
  }

  _openHistoryCurriculumVitae(BuildContext context) {

    Navigator.push(context,MaterialPageRoute(builder: (context) => const CurriculumVitaeHistoryWorkerPage()));
  }

  _addCurriculumVitaeReferences(BuildContext context) {

    Navigator.push(context,MaterialPageRoute(builder: (context) => const CurriculumVitaeAddWorkerReferencesPage()));
  }

  _editCurriculumVitae(BuildContext context) {

    Navigator.push(context,MaterialPageRoute(builder: (context) => const CurriculumVitaeEditWorkerPage()));
  }

  _editCurriculumVitaeReferences(BuildContext context) {

    Navigator.push(context,MaterialPageRoute(builder: (context) => const CurriculumVitaeEditWorkerPage()));
  }


}