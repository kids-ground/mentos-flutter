import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/home/bloc/home_bloc.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/presentation/widget/button/line_check_button.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloC = context.read<HomeBloc>();

    return Scaffold(
      appBar: CommonAppBar(
        bottomLine: false,
        leading: Image.asset(
          "assets/images/mentos.png",
          // color: ColorStyles.black700,
          width: 24,
        ),
        actions: [
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
            onPressed: () { },
            child: Image.asset(
              "assets/images/search.png",
              color: ColorStyles.black700
            ),
          ),
          CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            onPressed: () { },
            child: Image.asset(
              "assets/images/pencil.png",
              color: ColorStyles.black700
            ),
          )
        ],
      ),
      body: Container(
        color: ColorStyles.white,
        child: const Column(
          children: [
            _CategoryListView(),
            Divider(
              height: 0.2,
              thickness: 0.2,
              color: ColorStyles.white800,
            ),
            _ContentListView()
          ],
        ),
      )
    );
  }
}


class _CategoryListView extends StatelessWidget {
  const _CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloC = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Container(
        height: 12 + 12 + 32,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: HomeCategoryType.values.length,
          padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
          itemBuilder: (context, index) => LineCheckButton(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            title: HomeCategoryType.values[index].title,
            fontSize: 16,
            isSelected: index == state.selectedHomeCategroyId,
            onPressed: () {
              homeBloC.add(HomeSelectCategory(selectedHomeCategroyId: index));
            },
          )
        ),
      ),
    );
  }
}

class _ContentListView extends StatelessWidget {
  const _ContentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (Platform.isAndroid) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async { },
              child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => _ContentListItem()
              ),
            ),
          );
        } else {
          return Expanded(
            child: Container(
              color: ColorStyles.white300,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () {
                      return Future.delayed(const Duration(milliseconds: 1000));
                    },
                  ),
                  const SliverPadding(padding: EdgeInsets.fromLTRB(0, 0, 0, 16),),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 100,
                      (context, index) => _ContentListItem(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}

class _ContentListItem extends StatelessWidget {
  const _ContentListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomValue = Random().nextInt(10);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,12), // 최외각 패딩
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorStyles.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12), // 카드 내 패딩
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: randomValue % 2 == 0 ? ColorStyles.red100 : ColorStyles.blue100
                    ),
                    child: Text(
                      randomValue % 2 == 0 ? '멘토링 요청' : '멘토링 제안',
                      style: TextStyle(
                        fontSize: 14,
                        color: randomValue % 2 == 0 ? ColorStyles.red1000 : ColorStyles.blue1000
                      ),
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: ColorStyles.white300
                    ),
                    child: Text(
                      randomValue % 2 == 0 ? '소프트웨어 개발' : '마케팅',
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorStyles.black800
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (randomValue % 2 == 1)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,2,0),
                          child: Image.asset(
                            'assets/images/certification_mark.png',
                            width: 16,
                            height: 16,
                            color: Colors.green,
                          ),
                        ),
                      Text(
                        randomValue % 2 == 1 ? '카카오' : '취준생',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorStyles.black700
                        ),
                      ),
                      Text(
                        '  ·  천재개발자',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black500
                        ),
                      ),

                    ],
                  )
                ],
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '삼성전자 솦웨',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: ColorStyles.black700
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          '삼성전자 현직자분들께 여쭤보고 질문이 있습니다. 현직자분들 나와주세요!!!, 삼성전자 현직자분들께 여쭤보고 질문이 있습니다. 현직자분들 나와주세요!!!',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.black300
                          ),
                        ),
                        const SizedBox(height: 8,),
                      ],
                    ),
                  ),
                ),


                // 이미지가 있다면
                if (Random().nextInt(10) % 2 == 0)
                  CachedNetworkImage(
                    imageUrl: 'https://media.istockphoto.com/id/1430329340/ko/%EC%82%AC%EC%A7%84/%EC%B9%B4%EB%A9%94%EB%9D%BC%EB%A5%BC-%EB%B0%94%EB%9D%BC%EB%B3%B4%EB%A9%B0-%EB%88%84%EC%9B%8C-%EC%9E%88%EB%8A%94-%EB%B9%84%EA%B8%80-%EA%B0%95%EC%95%84%EC%A7%80%EC%9D%98-%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4-%EC%B4%88%EC%83%81%ED%99%94.webp?b=1&s=170667a&w=0&k=20&c=tn4wEgRhROAx-vesouY7TLESLiQaH1r3LVEMZNs6LU8=',
                    width: 80,
                    height: 80,
                    fadeInDuration: const Duration(milliseconds: 200),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    placeholder: (context, url) => Container(
                      width: 80,
                      height: 80,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      '조회 6',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.white1000
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Text(
                      '채팅 6',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.white1000
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Text(
                      '32분 전',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.white1000
                      ),
                    ),
                  ],
                ),
                Text(
                  '20,000원', // or '제안'
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.black700
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}


