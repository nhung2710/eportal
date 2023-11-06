import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/candidate_block/page/candidate_block_page.dart';
import 'package:eportal/screen/candidate_save/page/candidate_save_page.dart';
import 'package:eportal/screen/candidate_view/page/candidate_view_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class CandidatePage extends BasePage{
  const CandidatePage({super.key});
  @override
  State<StatefulWidget> createState() => _CandidatePageState();
}

class _CandidatePageState extends BasePageState<CandidatePage>{
  @override
  bool isHasAppBar(BuildContext context)  => false;
  @override
  double currentPadding(BuildContext context) => 0;

  @override
  Widget pageUI(BuildContext context) => DefaultTabController(
    length: 3,
    child: Column(
      children: [
        Container(
          color: Colors.blue,
          child: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.remove_red_eye_sharp,size: 20,),
              ),
              Tab(
                icon: Icon(Icons.save,size: 20,),
              ),
              Tab(
                icon: Icon(Icons.block,size: 20,),
              ),
            ],
          ),
        ),
        const Expanded(
            child: TabBarView(
              children: [
                CandidateViewPage(),
                CandidateSavePage(),
                CandidateBlockPage(),
              ],
            ),
        )
      ],
    ),
  );


}