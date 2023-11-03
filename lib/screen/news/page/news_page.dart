import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class NewsPage extends BasePage{
  const NewsPage({super.key});


  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends BasePageState<NewsPage>{
  @override
  Widget pageUI(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(8,0,8,0),
    color: Colors.black12,
    height: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bạn muốn tìm kiếm tin tức",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 12,)),
                            Text("Nội dung tìm kiếm",style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.black26),),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.search,color: Colors.green,),
                  ),
                ],
              )
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.access_alarm),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Tin tức tổng hợp",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 2,
                viewportFraction: 0.75,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: ApplicationConstant.URL_NEW.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        child: ImageLoading(
                            imageUrl: item,
                            imageBuilder: (context, imageProvider)
                            {
                              return Image(image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            }
                        )
                    );                    },
                );                }).toList(),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.work),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Tin tức về lĩnh vực việc làm",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 2,
                viewportFraction: 0.75,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: ApplicationConstant.URL_NEW.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        child: ImageLoading(
                            imageUrl: item,
                            imageBuilder: (context, imageProvider)
                            {
                              return Image(image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            }
                        )
                    );                    },
                );                }).toList(),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.work),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Tin tức về thị trường lao động",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 2,
                viewportFraction: 0.75,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: ApplicationConstant.URL_NEW.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        child: ImageLoading(
                            imageUrl: item,
                            imageBuilder: (context, imageProvider)
                            {
                              return Image(image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            }
                        )
                    );                    },
                );                }).toList(),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.add_chart_sharp),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Tin tức về bảo hiểm thất nghiệp",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 2,
                viewportFraction: 0.75,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: ApplicationConstant.URL_NEW.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        child: ImageLoading(
                            imageUrl: item,
                            imageBuilder: (context, imageProvider)
                            {
                              return Image(image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            }
                        )
                    );                    },
                );                }).toList(),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.add_chart_sharp),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Tin tức về giảm nghèo",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                  ),
                ],
              )
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 2,
                viewportFraction: 0.75,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: ApplicationConstant.URL_NEW.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        child: ImageLoading(
                            imageUrl: item,
                            imageBuilder: (context, imageProvider)
                            {
                              return Image(image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            }
                        )
                    );                    },
                );                }).toList(),
            ),
          ),
        ],
      ),
    ),
  );

}