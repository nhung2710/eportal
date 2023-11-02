import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eportal/api/adapter/base/base_adapter_api.dart';
import 'package:eportal/api/model/request/commonnew/home_works_list_request.dart';
import 'package:eportal/page/login/view/login_page.dart';
import 'package:eportal/style/app_text_style.dart';
import 'package:eportal/widget/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// Created by BlackRose on 11/1/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class DataCenterPage extends BasePage{
  const DataCenterPage({super.key});


  @override
  State<StatefulWidget> createState() => _DataCenterPageState();
}

class _DataCenterPageState extends BasePageState<DataCenterPage>{
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget pageUI(BuildContext context) => Scaffold(
    body: PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: const <Widget>[
        HomeFragment(),
        ProfileFragment(),
        CommentFragment(),
        NotificationFragment(),
        UserFragment()
      ],

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    floatingActionButton: FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      hoverColor: Colors.blue,
      focusColor: Colors.red,
      foregroundColor: Colors.black,
      backgroundColor: Colors.green,
      onPressed: () {
        showBottomError("Tính năng đang phát triển");
      },
      child: const Icon(Icons.add,color: Colors.white),
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      fixedColor: Colors.red,
      unselectedItemColor: Colors.blueAccent,
      selectedFontSize: 8,
      unselectedFontSize: 8,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.blueAccent,),
          label: "Trang chủ",
          activeIcon: Icon(Icons.home,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility,color: Colors.blueAccent,),
          label: "Hồ sơ",
          activeIcon: Icon(Icons.accessibility,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment,color: Colors.blueAccent,),
          label: "Bình luận",
          activeIcon: Icon(Icons.comment,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications,color: Colors.blueAccent,),
          label: "Thông báo",
          activeIcon: Icon(Icons.notifications,color: Colors.red,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color: Colors.blueAccent,),
          label: "Tài khoản",
          activeIcon: Icon(Icons.account_circle,color: Colors.red,),
        ),
      ],

    ),
  );

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }
}
class HomeFragment extends StatelessWidget{
  const HomeFragment({super.key});
  @override
  Widget build(BuildContext context)  => Container(
    color: Colors.black12,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(10,5,10,5),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white12,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset('assets/images/ErrorImage.png'),
                      fit: BoxFit.contain,
                      imageUrl: 'https://via.placeholder.com/100',
                      imageBuilder: (context, imageProvider) { // you can access to imageProvider
                        return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                          backgroundImage: imageProvider,
                        );
                      },
                    )

                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chào trần hữu tùng",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 12,)),
                            Text("Chúc bạn buổi sáng tốt lành",style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.black26),),
                          ],
                        ),
                      )
                  )
                ],
              )
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10,5,10,5),
              padding: const EdgeInsets.all(3),
              color: Colors.white12,
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
            margin: const EdgeInsets.fromLTRB(10,5,10,5),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,index) => Container(
                      margin: const EdgeInsets.all(4.0),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                    child: Icon(index % 3 == 0 ? Icons.account_balance_wallet_rounded : index % 3 == 1 ? Icons.ac_unit_outlined : Icons.ad_units_rounded,color: Colors.orange,)
                  )
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,5,10,5),
            color: Colors.orange,
            child: Container(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                child: 	CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.asset('assets/images/ErrorImage.png'),
                  fit: BoxFit.contain,
                  imageUrl: 'https://down-vn.img.susercontent.com/file/vn-50009109-df0b36a3c21c48b987c7d7eb12dd129d',
                  imageBuilder: (context, imageProvider) { // you can access to imageProvider
                    return Image( // or any widget that use imageProvider like (PhotoView)
                      image: imageProvider,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    );
                  },
                )
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,5,10,0),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white12,
            ),
            child: Text("Top công ty hàng đầu",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 16,)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,0,10,5),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white12,
            ),
            child: RichText(
              text: TextSpan(
                style:AppTextStyle.labelTitleBold.copyWith(fontSize: 12,color: Colors.green),
                children: const [
                  TextSpan(text: "Tìm hiểu thêm"),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.info_outline,color: Colors.green,)
                      ),
                    ),
                  ),
                ]
              )

            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,0,10,5),
            padding: const EdgeInsets.all(3),
            child: GridView.builder(
                itemCount: 20,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_,index)=>
                Card(
                  margin: const EdgeInsets.all(5),
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 1,
                  child: GridTile(
                    header: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                          child: Text("$index")
                      ),
                    ),
                    footer: Container(
                        height: 30,
                        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: ElevatedButton.icon(
                          label: const Text('Theo dõi'),
                          onPressed: () => {},
                          icon: const Icon(Icons.add),
                        )
                    ),
                    child: Center(
                        child: Container(
                            padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                            child: 	CachedNetworkImage(
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset('assets/images/ErrorImage.png'),
                              fit: BoxFit.fill,
                              imageUrl: 'https://down-vn.img.susercontent.com/file/vn-50009109-df0b36a3c21c48b987c7d7eb12dd129d',
                              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                                return Image( // or any widget that use imageProvider like (PhotoView)
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                );
                              },
                            )
                        )
                    ),
                  ),

                )
            ),
          )
        ],
      ),
    ),
  );
}
class ProfileFragment extends StatelessWidget{
  const ProfileFragment({super.key});
  @override
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
      width: MediaQuery.of(context).size.width,
      child: const Text("ProfileFragment"),
    ),
  );
}
class CommentFragment extends StatelessWidget{
  const CommentFragment({super.key});
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: Container(
        color: Colors.blue,
        child: Column(
          children: List.generate(100, (index) => Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            padding: const EdgeInsets.all(10),
            margin:  const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Text("Comment $index",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 14,color: Colors.white),)
                ),
                Expanded(
                    child: Text("Nội dung $index",style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.white),)
                )
              ],
            ),
          )),
        )
    ),
  );
}
class NotificationFragment extends StatelessWidget{
  const NotificationFragment({super.key});
  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
    child: Container(
      color: Colors.red,
      child: Column(
        children: List.generate(100, (index) => Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black26,
          ),
          padding: const EdgeInsets.all(10),
          margin:  const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Text("Tiêu đề $index",style: AppTextStyle.labelTitleBold.copyWith(fontSize: 14,color: Colors.white),)
              ),
              Expanded(
                  child: Text("Nội dung $index",style: AppTextStyle.labelTitle.copyWith(fontSize: 12,color: Colors.white),)
              )
            ],
          ),
        )),
      )
    ),
  );
}
class UserFragment extends StatelessWidget{
  const UserFragment({super.key});
  @override
  Widget build(BuildContext context)  => Column(
    children: [
      Container(
          padding: const EdgeInsets.only(top: 10 , bottom: 10 ,left: 5,right: 30),
          color: Colors.white,
          height: 80,
          child: Row(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset('assets/images/ErrorImage.png'),
                fit: BoxFit.contain,
                imageUrl: 'https://via.placeholder.com/100',
                imageBuilder: (context, imageProvider) { // you can access to imageProvider
                  return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                    backgroundImage: imageProvider,
                  );
                },
              )
              ,
              const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                    child: Text("Trần Hữu Tùng"),
                  )
              )
            ],
          )
      ),
      Expanded(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Thông tin",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Chưa cập nhật",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                              ),
                            ],
                          )
                      ),
                      const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Thông tin",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Chưa cập nhật",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                              ),
                            ],
                          )
                      ),
                      const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Thông tin",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: const Text("Chưa cập nhật",textAlign: TextAlign.end,style: AppTextStyle.labelTitle)
                              ),
                            ],
                          )
                      ),
                      const Text("Sửa",textAlign: TextAlign.end,style: AppTextStyle.labelAction)
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Quản lý hồ sơ",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.insert_chart,size: 30,color: Colors.green,),
                      const Expanded(
                          flex: 1,
                          child:
                          Padding(
                            padding: EdgeInsets.only( left: 10,right: 10),
                            child: Text("Thông tin tìm việc",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold),
                          )
                      ),
                      Switch(
                          value: true, onChanged: (v)=> {}
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.insert_chart,size: 30,color: Colors.green,),
                      const Expanded(
                          flex: 1,
                          child:
                          Padding(
                            padding: EdgeInsets.only( left: 10,right: 10),
                            child: Text("Cho phép NTD liên hệ",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold),
                          )
                      ),
                      Switch(
                          value: false,
                          onChanged: (v)=> {},
                          activeColor: Colors.red,


                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  height: 0.5,
                  thickness: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                  child: Container(
                      padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                      child: 	CachedNetworkImage(
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset('assets/images/ErrorImage.png'),
                        fit: BoxFit.contain,
                        imageUrl: 'https://down-vn.img.susercontent.com/file/vn-50009109-df0b36a3c21c48b987c7d7eb12dd129d',
                        imageBuilder: (context, imageProvider) { // you can access to imageProvider
                          return Image( // or any widget that use imageProvider like (PhotoView)
                            image: imageProvider,
                            height: 80,
                            fit: BoxFit.fitWidth,
                          );
                        },
                      )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Quản lý tìm việc",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: List.generate(5, (index) =>Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black12,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Icon(Icons.shopping_bag,color: Colors.green,)
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text("Việc làm đang ứng tuyển",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold.copyWith(fontSize: 8)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text("0",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold.copyWith(fontSize: 8)),
                                        )
                                      ],
                                    )
                                )
                              ],
                            )
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                  child: 	CachedNetworkImage(
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.asset('assets/images/ErrorImage.png'),
                    fit: BoxFit.contain,
                    imageUrl: 'https://down-vn.img.susercontent.com/file/vn-50009109-df0b36a3c21c48b987c7d7eb12dd129d',
                    imageBuilder: (context, imageProvider) { // you can access to imageProvider
                      return Image( // or any widget that use imageProvider like (PhotoView)
                        image: imageProvider,
                        height: 80,
                        fit: BoxFit.fitWidth,
                      );
                    },
                  )
                ),
                const Divider(
                  color: Colors.black12,
                  height: 10,
                  thickness: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Cài đặt tài khoản",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child: Column(
                    children: List.generate(5, (index) =>Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              color: Colors.black12,
                              width: 0.5
                          )),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.lock),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  margin: const EdgeInsets.only(right: 10,left: 10),
                                  child: const Text("Tính năng mới",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold)
                              ),
                            ),
                            const FaIcon(FontAwesomeIcons.angleRight,size: 20)
                          ],
                        )
                    )),
                  )
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: const Text("Chính sách và hỗ trợ",textAlign: TextAlign.end,style: AppTextStyle.labelTitleBold)
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                    child: Column(
                      children: List.generate(5, (index) =>Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(
                                color: Colors.black12,
                                width: 0.5
                            )),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.lock),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    margin: const EdgeInsets.only(right: 10,left: 10),
                                    child: const Text("Tính năng mới",textAlign: TextAlign.start,style: AppTextStyle.labelTitleBold)
                                ),
                              ),
                              const FaIcon(FontAwesomeIcons.angleRight,size: 20)
                            ],
                          )
                      )),
                    )
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text('Đăng nhập'),
                      onPressed: () => _signInAsync(context),
                    )
                ),
              ],
            )
        ),
      )
    ],
  );

  _signInAsync(context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
