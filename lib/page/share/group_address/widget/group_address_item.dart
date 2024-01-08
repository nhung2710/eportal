//
// Created by BlackRose on 08/01/2024.
// Copyright (c) 2024 Hilo All rights reserved.
//
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widget/default_text_form_field.dart';
import '../page/group_address_page.dart';

class GroupAddressItem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GroupAddressItemState();
}

class GroupAddressItemState extends State<GroupAddressItem>{
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(focusNodeEvent);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.removeListener(focusNodeEvent);
  }
  @override
  Widget build(BuildContext context) => DefaultTextFormField(
    focusNode: focusNode,
  );

  void focusNodeEvent() {
    if(focusNode.hasFocus){
      focusNode.unfocus();
      Navigator.push(context, MaterialPageRoute(builder: (_)=> const GroupAddressPage(title: "")));
    }

  }
}