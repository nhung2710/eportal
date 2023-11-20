import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/screen/share/chat_bot/page/chat_bot_page.dart';
import 'package:eportal/screen/share/news_hub/widget/home_news_list_preview.dart';
import 'package:eportal/screen/share/news_hub/widget/home_works_list_preview.dart';
import 'package:eportal/style/app_text_style.dart';
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
import '../../job_user_search/page/job_user_search_page.dart';
import '../../news_search/page/news_search_page.dart';
import '../../work_search/page/work_search_page.dart';
import '../widget/home_business_list_preview.dart';
import '../widget/home_document_list_preview.dart';
import '../widget/home_job_user_list_preview.dart';

//
// Created by BlackRose on 11/7/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsHubPage extends BasePage {
  const NewsHubPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsHubPageState();
}

class _NewsHubPageState extends BasePageStateActive<NewsHubPage> {
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
                margin: const EdgeInsets.only(top: 5),
                child: BlocProvider(
                    create: (_) => homeSlideListBloc,
                    child: BlocListener<HomeSlideListBloc, BaseState>(
                      listener: (BuildContext context, BaseState state) {},
                      child: BlocBuilder<HomeSlideListBloc, BaseState>(
                        builder: (BuildContext context, BaseState state) =>
                            handlerBaseState<HomeSlideListResponse>(
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
                              autoPlayInterval: const Duration(seconds: 10),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 5),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.1,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: (state.data ?? []).map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: ImageLoading(
                                          imageUrl: item.avatar.getImageUrl(),
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return Image(
                                              image: imageProvider,
                                              fit: BoxFit.fitHeight,
                                            );
                                          }));
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
                crossAxisSpacing: 5,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CustomButtonIcon(
                    title: "Tin tức",
                    iconData: Icons.newspaper,
                    onTap: () => nextPage((context) => const NewsSearchPage()),
                  ),
                  CustomButtonIcon(
                    title: "Tuyển dụng",
                    iconData: Icons.work,
                    onTap: () => nextPage((context) => const WorkSearchPage()),
                  ),
                  CustomButtonIcon(
                    title: "Hồ sơ",
                    iconData: Icons.people,
                    onTap: () =>
                        nextPage((context) => const JobUserSearchPage()),
                  ),
                  CustomButtonIcon(
                    title: "Doanh nghiệp",
                    iconData: Icons.business_sharp,
                  ),
                  CustomButtonIcon(
                    title: "Tìm việc",
                    iconData: Icons.search,
                  ),
                  CustomButtonIcon(
                    title: "Tìm việc",
                    iconData: Icons.search,
                  ),
                  CustomButtonIcon(
                    title: "Tìm việc",
                    iconData: Icons.search,
                  ),
                  CustomButtonIcon(
                    title: "Tìm việc",
                    iconData: Icons.search,
                  ),
                  CustomButtonIcon(
                    title: "Tìm việc",
                    iconData: Icons.search,
                  ),
                  CustomButtonIcon(
                    title: "Tìm việc",
                    iconData: Icons.search,
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColor.colorOfHintText, width: 0.5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Tin bài",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 400.0,
                      ),
                      child: HomeNewsListPreview(
                        flag: 1,
                      ),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColor.colorOfHintText, width: 0.5),
                  color: Colors.white,
                ),
                child: DefaultTabController(
                  key: localKey,
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        child: const Text(
                          "Tin tuyển dụng",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.titlePage,
                        ),
                      ),
                      const TabBar(
                        indicatorColor: AppColor.colorOfIcon,
                        labelColor: AppColor.colorOfIcon,
                        labelStyle: AppTextStyle.title,
                        indicatorWeight: 2,
                        tabs: [
                          Tab(
                            text: "Tốt nhất",
                          ),
                          Tab(
                            text: "Mới nhất",
                          ),
                          Tab(
                            text: "Lương cao",
                          ),
                        ],
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 35.0,
                          maxHeight: 400.0,
                        ),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            HomeWorksListPreview(flag: 0),
                            HomeWorksListPreview(flag: 1),
                            HomeWorksListPreview(flag: 2),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColor.colorOfHintText, width: 0.5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Doanh nghiệp tuyển dụng",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 400.0,
                      ),
                      child: const HomeBusinessListPreview(),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColor.colorOfHintText, width: 0.5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Hồ sơ ứng tuyển",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 400.0,
                      ),
                      child: const HomeJobUserListPreview(),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColor.colorOfHintText, width: 0.5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: const Text(
                        "Văn bản pháp luật",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titlePage,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 200.0,
                      ),
                      child: const HomeDocumentListPreview(),
                    )
                  ],
                )),
          ],
        ),
      );
}
