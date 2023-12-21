import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../extension/color_extension.dart';
import '../../../../widget/base/base_page.dart';

//
// Created by BlackRose on 14/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class ChartUnemploymentRatePage extends BasePage {
  const ChartUnemploymentRatePage({super.key});

  @override
  State<StatefulWidget> createState() => _ChartUnemploymentRatePageState();
}

class _ChartUnemploymentRatePageState
    extends BasePageState<ChartUnemploymentRatePage> {
  List<Color> colors = [];
  List<double> percents = [];

  @override
  void initDataLoading() {
    double max = 100;
    int itemLength = Random().nextInt(10);
    for (var i = 0; i < itemLength - 1; i++) {
      var percent = max * Random().nextDouble() * Random().nextDouble();
      percents.add(percent);
      colors.add(getRandomColor());
      max -= percent;
    }
    percents.add(max);
    colors.add(getRandomColor());
  }

  @override
  void callApi() {
    // TODO: implement callApi
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
  }

  @override
  String getPageTitle(BuildContext context) => "Lao động thất nghiệp";

  @override
  Color currentBackgroundColor(BuildContext context) => Colors.white;

  int touchedIndex = -1;

  @override
  Widget pageUI(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 100,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    var f = NumberFormat("###.0#", "en_US");
    List<PieChartSectionData> pieChartSectionDatas = [];
    for (var i = 0; i < colors.length; i++) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      pieChartSectionDatas.add(PieChartSectionData(
        color: colors[i],
        value: percents[i],
        title: '${f.format((percents[i]))}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: colors[i],
          shadows: shadows,
        ),
      ));
    }
    return pieChartSectionDatas;
  }
}
