import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/8/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class AnswerAndQuestionItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final int index;

  const AnswerAndQuestionItem({super.key, required this.onTap, this.index = 0});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                margin: const EdgeInsets.only(top: 5, left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.question_answer,
                      color: Colors.blue,
                      size: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          child: Text("Vấn đề $index",
                              textAlign: TextAlign.start,
                              style: AppTextStyle.title
                                  .copyWith(color: Colors.blue))),
                    ),
                    const Icon(
                      Icons.navigate_next_sharp,
                      color: Colors.blue,
                      size: 20,
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
                margin: const EdgeInsets.only(top: 5, left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.question_answer,
                      color: Colors.blue,
                      size: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          child: Text("Kết quả $index",
                              textAlign: TextAlign.start,
                              style: AppTextStyle.title
                                  .copyWith(color: Colors.blue))),
                    ),
                    const Icon(
                      Icons.navigate_next_sharp,
                      color: Colors.blue,
                      size: 20,
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
                margin: const EdgeInsets.only(top: 5, left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.question_answer,
                      color: Colors.blue,
                      size: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          child: Text("Kết quả $index",
                              textAlign: TextAlign.start,
                              style: AppTextStyle.title
                                  .copyWith(color: Colors.blue))),
                    ),
                    const Icon(
                      Icons.navigate_next_sharp,
                      color: Colors.blue,
                      size: 20,
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
                margin: const EdgeInsets.only(top: 5, left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.question_answer,
                      color: Colors.blue,
                      size: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          child: Text("Kết quả $index",
                              textAlign: TextAlign.start,
                              style: AppTextStyle.title
                                  .copyWith(color: Colors.blue))),
                    ),
                    const Icon(
                      Icons.navigate_next_sharp,
                      color: Colors.blue,
                      size: 20,
                    )
                  ],
                )),
          ),
        ],
      );
}
