//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:flutter/material.dart';

class LoadingProcess extends StatefulWidget{
  const LoadingProcess({super.key});

  @override
  State<StatefulWidget> createState()  => LoadingProcessState();
}

class LoadingProcessState extends State<LoadingProcess> 
{
  double percent = 0.0;
  String labelTxt = "Đang tải dữ liệu 0%";
  setEndLoading(){
    percent = 1;
  }

  updatePercent(double percent){
    this.percent += percent;
    if(this.percent >1) {
      setEndLoading();
    }
    print("percent - current ${percent}");
    print("percent ${this.percent}");
    labelTxt = "Đang tải dữ liệu ${(this.percent * 100).toInt()}%";
    setState(() {});
  }
  endLoading({String txt = "Đã tải xong dữ liệu"}){
    labelTxt = txt;
    setEndLoading();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 20,
    child: Stack(
      children: [
        Center(
          child: LinearProgressIndicator(
            minHeight: double.infinity,
            color: Colors.orange,
            backgroundColor: AppColor.colorOfIcon,
            value: percent,
          ),
        ),
        Center(
          child: Text(
            labelTxt,
            textAlign: TextAlign.center,
            style: AppTextStyle.title
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}