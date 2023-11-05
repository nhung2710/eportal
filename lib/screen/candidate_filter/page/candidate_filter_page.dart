import 'package:eportal/screen/candidate_block/page/candidate_block_page.dart';
import 'package:eportal/screen/candidate_save/page/candidate_save_page.dart';
import 'package:eportal/screen/candidate_view/page/candidate_view_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 05/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class CandidateFilterPage extends BasePage{
  const CandidateFilterPage({super.key});


  @override
  State<StatefulWidget> createState() => _CandidateFilterPageState();
}

class _CandidateFilterPageState extends BasePageState<CandidateFilterPage>{
  @override
  Widget pageUI(BuildContext context) => const DefaultTabController(
    length: 3,
    child: Column(
      children: [
        TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.remove_red_eye_outlined,size: 20,),
              text: "Xem",
            ),
            Tab(
              icon: Icon(Icons.save_alt_sharp,size: 20,),
              text: "Lưu",
            ),
            Tab(
              icon: Icon(Icons.block,size: 20,),
              text: "Chặn",
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              CandidateViewPage(),
              CandidateSavePage(),
              CandidateBlockPage(),
            ],
          ),
        ),
      ],
    ),
  );


}