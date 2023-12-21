//
// Created by BlackRose on 20/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/model/api/response/admin/data/chat_bot_danh_sach_hoi_thoai_data_response.dart';
import 'package:eportal/style/app_color.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/style/app_size_icon.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/button_icon/custom_button_icon.dart';
import 'package:eportal/widget/text_icon/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extension/error_extension.dart';
import '../../../../widget/default_button/default_button.dart';

class ChatBotManageItem extends StatelessWidget {
  final GestureTapCallback onTapDetail;
  final GestureTapCallback onTapDelete;
  final GestureTapCallback onTapChangeStar;
  final ChatBotDanhSachHoiThoaiDataResponse data;
  const ChatBotManageItem({super.key,
    required this.data,
    required this.onTapDetail,
    required this.onTapDelete,
    required this.onTapChangeStar,
  });

  @override
  Widget build(BuildContext context) => Card(
        elevation: AppElevation.sizeOfNormal,
        color: AppColor.colorOfApp,
        shadowColor: AppColor.colorOfIcon,
        borderOnForeground: false,
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColor.colorOfDrawer, width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextIcon(
                  text: data.tenHoiThoai,
                  overflow: TextOverflow.visible,
                  icon: FontAwesomeIcons.tags,
                  textStyle: AppTextStyle.title
                      .copyWith(color: Colors.black, fontSize: 12),
                  isHasBorder: false,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                               Icons.star_rate,
                              color: AppColor.colorOfIcon,
                              size: AppSizeIcon.sizeOfNormal,
                            ),
                          ),
                        ), // icon
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: onTapChangeStar,
                                child: RatingBarIndicator(
                                  rating: getRate(data.danhDauSao),
                                  unratedColor: Colors.grey,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: AppColor.colorOfIcon,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                              ),
                            ),
                          ),
                        ) // text
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: DefaultButton(
                          onPressed: onTapDetail,
                          text: "Chi tiết",
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: DefaultButton(
                          onPressed: onTapDelete,
                          backgroundColor: Colors.red,
                          text: "Xoá",
                        ),
                      )
                    ],
                  ),
                )
              ]),
        ),
      );

  double getRate(String? danhDauSao) {
    return ErrorExtension().handleFunctionError(() => double.tryParse(danhDauSao??"0")??0)??0;
  }
}
