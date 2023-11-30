import 'package:eportal/model/api/response/common_new/data/home_news_list_data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_news_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_news_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_news_list_request.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_color.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widget/base/base_page.dart';
import '../../../../widget/image/image_loading.dart';
import '../../empty_example/page/empty_example_page.dart';

//
// Created by BlackRose on 13/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeNewsListPage extends BasePage {
  int flag;

  HomeNewsListPage({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => _HomeNewsListPageState();
}

class _HomeNewsListPageState extends BasePageStateActive<HomeNewsListPage> {
  HomeNewsListBloc homeNewsListCommonBloc = HomeNewsListBloc();

  @override
  String getPageTitle(BuildContext context) {
    return "Tin bài";
  }

  @override
  void initDataLoading() {
    homeNewsListCommonBloc.add(HomeNewsListEvent(
        request: HomeNewsListRequest(
            obj: CommonNewDataRequest(
                flag: widget.flag,
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  Widget pageUI(BuildContext context) => BlocProvider(
      create: (_) => homeNewsListCommonBloc,
      child: BlocListener<HomeNewsListBloc,
          DataMultiState<HomeNewsListDataResponse>>(
        listener: (BuildContext context,
            DataMultiState<HomeNewsListDataResponse> state) {},
        child: BlocBuilder<HomeNewsListBloc,
            DataMultiState<HomeNewsListDataResponse>>(
          builder: (BuildContext context,
                  DataMultiState<HomeNewsListDataResponse> state) =>
              handleDataMultiState<HomeNewsListDataResponse>(
            state,
            (context, state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, i) => GestureDetector(
                      onTap: () => nextPage((context) => EmptyExamplePage(
                            isHasAppBar: true,
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 80,
                                child: ImageLoading(
                                  imageUrl: state!
                                      .elementAt(i)
                                      .imagePath
                                      .getImageUrl(),
                                  imageBuilder: (BuildContext context,
                                      ImageProvider<Object> imageProvider) {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Image(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                )),
                            Expanded(
                              flex: 1,
                              child: Text(
                                (state!.elementAt(i).title).supportHtml(),
                                style: AppTextStyle.title.copyWith(
                                    color: AppColor.colorOfText,
                                    overflow: TextOverflow.visible,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      ));
}
