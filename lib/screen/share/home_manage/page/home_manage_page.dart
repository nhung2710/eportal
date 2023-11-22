import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/model/api/response/common_new/data/home_slide_list_data_response.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/style/app_elevation.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/common_new/home_slide_list_bloc.dart';
import '../../../../constant/application_constant.dart';
import '../../../../event/common_new/home_slide_list_event.dart';
import '../../../../extension/string_extension.dart';
import '../../../../model/api/request/common_new/data/common_new_data_request.dart';
import '../../../../model/api/request/common_new/home_slide_list_request.dart';
import '../../../../model/api/response/common_new/home_slide_list_response.dart';
import '../../../../state/base/base_state.dart';
import '../../../../style/app_color.dart';
import '../../../../widget/button_icon/custom_button_icon.dart';
import '../../../../widget/image/image_loading.dart';
import '../../empty_example/page/empty_example_page.dart';
import '../../news/page/news_page.dart';
import '../../news_curriculum_vitae/page/news_curriculum_vitae_page.dart';
import '../../news_enterprise/page/news_enterprise_page.dart';
import '../../news_legal_document/page/news_legal_document_page.dart';
import '../../news_recruitment/page/news_recruitment_page.dart';

//
// Created by BlackRose on 16/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomeManagePage extends BasePage {
  const HomeManagePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeManagePageState();
}

class _HomeManagePageState extends BasePageStateActive<HomeManagePage> {
  HomeSlideListBloc homeSlideListBloc = HomeSlideListBloc();

  @override
  void initDataLoading() {
    homeSlideListBloc.add(HomeSlideListEvent(
        request: HomeSlideListRequest(
            obj: CommonNewDataRequest(
                top: ApplicationConstant.NUMBER_FULL_ITEM))));
    super.initDataLoading();
  }

  @override
  bool isHasAppBar(BuildContext context) => false;

  @override
  Widget? getFloatingActionButton(BuildContext context) =>
      ExpandableFab(children: [
        ActionButton(
          icon: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
          onPressed: () {
            loadDataDemo()
                .then((value) => nextPage((context) => const ChatBotPage()));
          },
        ),
      ]);

  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 0),
                child: BlocProvider(
                    create: (_) => homeSlideListBloc,
                    child: BlocListener<HomeSlideListBloc, DataState<List<HomeSlideListDataResponse>>>(
                      listener: (BuildContext context, DataState<List<HomeSlideListDataResponse>> state) {},
                      child: BlocBuilder<HomeSlideListBloc, DataState<List<HomeSlideListDataResponse>>>(
                        builder: (BuildContext context, DataState<List<HomeSlideListDataResponse>> state) =>
                            handleDataState<List<HomeSlideListDataResponse>>(
                          state,
                          (context, state) => CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2,
                              viewportFraction: 1,
                              animateToClosest: true,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.2,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: state!.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        nextPage((context) => EmptyExamplePage(
                                              isHasAppBar: true,
                                            )),
                                    child: Card(
                                      elevation: AppElevation.sizeOfNormal,
                                      margin: EdgeInsets.zero,
                                      color: AppColor.colorOfApp,
                                      shadowColor: AppColor.colorOfIcon,
                                      borderOnForeground: false,
                                      shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColor.colorOfDrawer,
                                              width: 0.1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: ImageLoading(
                                              imageUrl:
                                                  item.avatar.getImageUrl(),
                                              imageBuilder:
                                                  (context, imageProvider) {
                                                return Image(
                                                  image: imageProvider,
                                                  fit: BoxFit.fitHeight,
                                                );
                                              })),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                mainAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CustomButtonIcon(
                    title: "Tin tức",
                    iconData: Icons.newspaper,
                    onTap: () => nextPage((context) => NewsPage(
                          flag: 1,
                        )),
                  ),
                  CustomButtonIcon(
                    title: "Tuyển dụng",
                    iconData: Icons.work,
                    onTap: () => nextPage((context) => NewsRecruitmentPage(
                          flag: 1,
                        )),
                  ),
                  CustomButtonIcon(
                    title: "Hồ sơ",
                    iconData: Icons.people,
                    onTap: () =>
                        nextPage((context) => NewsCurriculumVitaePage()),
                  ),
                  CustomButtonIcon(
                    title: "Doanh nghiệp",
                    iconData: Icons.business_sharp,
                    onTap: () => nextPage((context) => NewsEnterprisePage()),
                  ),
                  CustomButtonIcon(
                    title: "Văn bản pháp luật",
                    iconData: Icons.folder_copy,
                    onTap: () => nextPage((context) => NewsLegalDocumentPage()),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
