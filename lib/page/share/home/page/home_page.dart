//
// Created by BlackRose on 27/12/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/bloc/common_new/home_advertise_list_bloc.dart';
import 'package:eportal/bloc/common_new/home_business_list_bloc.dart';
import 'package:eportal/bloc/common_new/home_slide_list_bloc.dart';
import 'package:eportal/event/common_new/home_advertise_list_event.dart';
import 'package:eportal/event/common_new/home_business_list_event.dart';
import 'package:eportal/event/common_new/home_slide_list_event.dart';
import 'package:eportal/model/api/request/common_new/data/home_advertise_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/home_business_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/data/home_slide_list_data_request.dart';
import 'package:eportal/model/api/request/common_new/home_advertise_list_request.dart';
import 'package:eportal/model/api/request/common_new/home_business_list_request.dart';
import 'package:eportal/model/api/request/common_new/home_slide_list_request.dart';
import 'package:eportal/model/api/response/common_new/data/home_advertise_list_data_response.dart';
import 'package:eportal/model/api/response/common_new/data/home_slide_list_data_response.dart';
import 'package:eportal/page/base/page_state/base_page_keep_state.dart';
import 'package:eportal/page/base/page_state/base_page_state.dart';
import 'package:eportal/page/base/page_widget/base_page_widget.dart';
import 'package:eportal/page/model/more_action_page_model.dart';
import 'package:eportal/page/share/album/page/album_page.dart';
import 'package:eportal/page/share/home/widget/home_page_action_item.dart';
import 'package:eportal/page/share/news/page/news_page.dart';
import 'package:eportal/page/share/news_search/page/news_search_page.dart';
import 'package:eportal/page/share/video/page/video_page.dart';
import 'package:eportal/page/widget/default_carousel_slider_image.dart';
import 'package:eportal/state/base/base_state.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../extension/string_extension.dart';
import '../../../widget/default_card_item.dart';

class HomePage extends BasePageWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends BasePageKeepState<HomePage> {
  late HomeSlideListBloc homeSlideListBloc;
  late HomeAdvertiseListBloc homeAdvertiseListBloc;
  late HomeBusinessListBloc homeBusinessListBloc;
  final CarouselController carouselController = CarouselController();
  HomeSlideListEvent homeSlideListEvent = HomeSlideListEvent(
      request: HomeSlideListRequest(obj: HomeSlideListDataRequest()));
  HomeBusinessListEvent homeBusinessListEvent = HomeBusinessListEvent(
      request: HomeBusinessListRequest(obj: HomeBusinessListDataRequest()));
  HomeAdvertiseListEvent homeAdvertiseListEvent = HomeAdvertiseListEvent(
      request: HomeAdvertiseListRequest(obj: HomeAdvertiseListDataRequest()));

  Map<String, List<MoreActionPageModel>> actions =
      <String, List<MoreActionPageModel>>{};
  final List<Widget> children = [];

  @override
  void callApi() {
    // TODO: implement callApi
    homeSlideListBloc.add(homeSlideListEvent);
    homeBusinessListBloc.add(homeBusinessListEvent);
    homeAdvertiseListBloc.add(homeAdvertiseListEvent);
  }

  @override
  void disposeBloc() {
    // TODO: implement disposeBloc
    homeSlideListBloc.close();
    homeAdvertiseListBloc.close();
    homeBusinessListBloc.close();
  }

  @override
  void getMoreData() {
    // TODO: implement getMoreData
  }

  @override
  void initBloc() {
    // TODO: implement initBloc
    homeSlideListBloc = HomeSlideListBloc();
    homeAdvertiseListBloc = HomeAdvertiseListBloc();
    homeBusinessListBloc = HomeBusinessListBloc();
    actions.clear();
    actions.putIfAbsent(
        "Tin tức",
        () => [
              MoreActionPageModel(
                  icon: Icons.newspaper,
                  title: "Tổng hợp",
                  function: () => nextPage((context) => const NewsPage(flag: 1,))),
              MoreActionPageModel(
                  icon: Icons.work,
                  title: "Tuyển dụng",
                  function: () => nextPage((context) => const AlbumPage())),
              MoreActionPageModel(
                  icon: Icons.people,
                  title: "Hố sơ",
                  function: () => nextPage((context) => const AlbumPage())),
              MoreActionPageModel(
                  icon: Icons.business_sharp,
                  title: "Doanh nghiệp",
                  function: () => nextPage((context) => const AlbumPage())),
              MoreActionPageModel(
                  icon: Icons.folder_copy,
                  title: "Văn bản pháp luật",
                  function: () => nextPage((context) => const AlbumPage())),
            ]);
    actions.putIfAbsent(
        "Tìm kiếm",
        () => [
          MoreActionPageModel(
              icon: Icons.newspaper,
              title: "Tổng hợp",
              function: () => nextPage((context) => const NewsSearchPage())),
          MoreActionPageModel(
              icon: Icons.work,
              title: "Tuyển dụng",
              function: () => nextPage((context) => const AlbumPage())),
          MoreActionPageModel(
              icon: Icons.people,
              title: "Hố sơ",
              function: () => nextPage((context) => const AlbumPage())),
          MoreActionPageModel(
              icon: Icons.folder_copy,
              title: "Văn bản pháp luật",
              function: () => nextPage((context) => const AlbumPage())),
            ]);

    children.clear();
    children.addAll(actions.entries
        .map((e) => HomePageActionItem(
              title: e.key,
              items: e.value,
              onClickItem: (item) => item.function(),
            ))
        .toList());
  }

  @override
  void initDataLoading() {
    // TODO: implement initDataLoading
    callApi();
  }

  @override
  double currentPadding(BuildContext context) => 5;

  @override
  Widget pageUI(BuildContext context) => ListView(
        children: [
          BlocProvider(
              create: (_) => homeSlideListBloc,
              child: BlocListener<HomeSlideListBloc,
                  DataMultiState<HomeSlideListDataResponse>>(
                listener: (BuildContext context,
                    DataMultiState<HomeSlideListDataResponse> state) {},
                child: BlocBuilder<HomeSlideListBloc,
                    DataMultiState<HomeSlideListDataResponse>>(
                  builder: (BuildContext context,
                          DataMultiState<HomeSlideListDataResponse> state) =>
                      handleDataMultiState<HomeSlideListDataResponse>(
                    state,
                    (context, state) =>
                        DefaultCarouselSliderImage<HomeSlideListDataResponse>(
                      data: state,
                      builder: (BuildContext context, int index,
                              HomeSlideListDataResponse item) =>
                          DefaultCardItem(
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: ImageLoading(
                                imageUrl: item.avatar.getImageUrl(),
                                imageBuilder: (context, imageProvider) {
                                  return Image(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  );
                                })),
                      ),
                    ),
                  ),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: children,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: BlocProvider(
                create: (_) => homeAdvertiseListBloc,
                child: BlocListener<HomeAdvertiseListBloc,
                    DataMultiState<HomeAdvertiseListDataResponse>>(
                  listener: (BuildContext context,
                      DataMultiState<HomeAdvertiseListDataResponse> state) {},
                  child: BlocBuilder<HomeAdvertiseListBloc,
                      DataMultiState<HomeAdvertiseListDataResponse>>(
                    builder: (BuildContext context,
                            DataMultiState<HomeAdvertiseListDataResponse>
                                state) =>
                        handleDataMultiState<HomeAdvertiseListDataResponse>(
                      state,
                      (context, state) => DefaultCarouselSliderImage<
                          HomeAdvertiseListDataResponse>(
                        data: state,
                        builder: (BuildContext context, int index,
                                HomeAdvertiseListDataResponse item) =>
                            DefaultCardItem(
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: ImageLoading(
                                  imageUrl: item.images.getImageUrl(),
                                  imageBuilder: (context, imageProvider) {
                                    return Image(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    );
                                  })),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      );
}
