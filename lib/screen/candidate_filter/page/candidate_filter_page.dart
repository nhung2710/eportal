import 'dart:math';

import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/screen/candidate_block/page/candidate_block_page.dart';
import 'package:eportal/screen/candidate_save/page/candidate_save_page.dart';
import 'package:eportal/screen/candidate_view/page/candidate_view_page.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
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
  TextEditingController searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget pageUI(BuildContext context) => Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: TextFormField(
              obscureText: true,
              controller: searchController,
              maxLength: 50,
              textInputAction: TextInputAction.done,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Không được từ để trống';
                }
                return null;
              },

              onFieldSubmitted:  (value) => _searchCandidateAsync(context),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tìm kiếm',
                counterText: "",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search,color: Colors.blue,),
                  onPressed: () => _searchCandidateAsync(context),
                ),
              ),
            ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 50,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
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
          ),
        )
      ],
    ),
  );
  final Random _random = Random(20);
  _searchCandidateAsync(BuildContext context) {
    if(_formKey.currentState!.validate()){
      startLoading();
      Future.delayed(const Duration(seconds: 1))
          .then((value){
        stopLoading();
        _random.nextBool() ? showCenterError("Không tìm thấy kết quả bạn muốn tìm") : showCenterMessage("Tìm thấy kết quả bạn muốn tìm");
      });
    }
  }


}