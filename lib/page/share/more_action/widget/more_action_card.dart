//
// Created by BlackRose on 29/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/more_action/widget/group_more_action_sub_item.dart';
import 'package:eportal/style/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../application/global_application.dart';
import '../../../../style/app_text_style.dart';
import '../../../widget/default_card_item.dart';
import '../../../widget/default_image_network.dart';

class MoreActionCard extends StatelessWidget {
  final GestureTapCallback onSignIn;
  final GestureTapCallback onSignOut;
  const MoreActionCard({super.key,required this.onSignIn,required this.onSignOut});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 5,bottom: 20),
    child: DefaultCardItem(
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 80,
                      minWidth: 80
                    ),
                    child: DefaultImageNetwork(
                      imageUrl:
                          "https://www.w3schools.com/bootstrap5/img_avatar12.png",
                      localImageError: "assets/images/userLogo.png",
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundColor: AppColor.colorOfIcon,
                        radius: 40,
                        child: CircleAvatar(
                          backgroundImage: imageProvider,
                          foregroundColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          radius: 39,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text(GlobalApplication().helloUser(),style: AppTextStyle.titlePage.copyWith(color: AppColor.colorOfIconActive),),
                            Text(GlobalApplication().helloMessage(),style: AppTextStyle.title.copyWith(color: AppColor.colorOfIcon),),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: createButton(),
                              ),
                            )
                          ],
                        ),
                  ))
                ],
              ),
            ),
          ),
        ),
  );

  Widget createButton(){
    MoreActionPageModel action;
    if(GlobalApplication().isLogin){
      action = MoreActionPageModel(icon: Icons.logout, title: "Đăng xuất", function: () => onSignOut());
    }
    else{
      action = MoreActionPageModel(icon: Icons.login, title: "Đăng nhập", function: ()=> onSignIn());
    }
    return GroupMoreActionSubItem(item: action,onClickItem: (v) => action.function(),);
  }
}
