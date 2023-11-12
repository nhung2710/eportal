import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class ContractPage extends BasePage {
  const ContractPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContractPageState();
}

class _ContractPageState extends BasePageState<ContractPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  String getPageTitle(BuildContext context) => "Liên hệ";

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            10,
            (index) => Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
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
                      child: Text(
                        "Hỏi và đáp",
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titleAppbarPage,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
}
