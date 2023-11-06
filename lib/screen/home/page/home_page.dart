import 'package:carousel_slider/carousel_slider.dart';
import 'package:eportal/application/global_application.dart';
import 'package:eportal/constant/application_constant.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:eportal/widget/image/image_loading.dart';
import 'package:flutter/material.dart';

//
// Created by BlackRose on 11/3/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//

class HomePage extends BasePage{
  const HomePage({super.key});


  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage>{
  @override
  bool isHasAppBar(BuildContext context) => false;
  @override
  Widget pageUI(BuildContext context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                          Text("Bạn muốn tìm việc",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 12,)),
                          Text("Địa điểm - Công ty Vị tri ngành",style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.black26),),
                        ],
                      ),
                    )
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.map_outlined,color: Colors.green,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index) => Container(
                    margin: const EdgeInsets.all(4.0),
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white60,
                    ),
                    child: Icon(index % 3 == 0 ? Icons.account_balance_wallet_rounded : index % 3 == 1 ? Icons.ac_unit_outlined : Icons.ad_units_rounded,color: Colors.orange,)
                )
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(Icons.newspaper),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Tin tức",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 2,
              viewportFraction: 0.7,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
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
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(Icons.newspaper),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Việc làm",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 2,
              viewportFraction: 0.7,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
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
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(Icons.newspaper),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Hồ sơ xin việc",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 2,
              viewportFraction: 0.7,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
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
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(Icons.newspaper),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Quảng cáo",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 2,
              viewportFraction: 0.7,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
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
                Icon(Icons.newspaper),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Văn bản pháp luật",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold,),
                ),
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 2,
              viewportFraction: 0.7,
              animateToClosest:  true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 3000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
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
  );

}
