import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/view/mentor_detail_page.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class MentorMainPage extends StatelessWidget {
  const MentorMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MentorMainView();
  }
}

class _MentorMainView extends StatelessWidget {
  const _MentorMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '멘토', bottomLine: false,),
      body: SafeArea(
        child: Container(
          color: ColorStyles.white100,
          child: Column(
            children: [
              _MentorFilterView(),
              Expanded(child: _MentorListView()),
            ],
          )
        ),
      ),
    );
  }
}

class _MentorFilterView extends StatelessWidget {
  const _MentorFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        border: Border(
          bottom: BorderSide(
            width: 0.1,
            color: ColorStyles.black100
          ),
        )

      ),
      child: Row(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            color: Colors.transparent,
            minSize: 0,
            onPressed: () { },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorStyles.white,
                  border: Border.all(
                      color: ColorStyles.white500
                  )
              ),
              child: Row(
                children: [
                  Text(
                    '직군',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.black500,
                        decoration: null
                    )
                  ),
                  Icon( // <-- Icon
                    Icons.arrow_drop_down_rounded,
                    size: 24.0,
                    color: ColorStyles.black100,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8,),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            color: Colors.transparent,
            minSize: 0,
            onPressed: () { },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorStyles.white,
                  border: Border.all(
                      color: ColorStyles.white500
                  )
              ),
              child: Row(
                children: [
                  Text(
                      '년차',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black500,
                          decoration: null
                      )
                  ),
                  Icon( // <-- Icon
                    Icons.arrow_drop_down_rounded,
                    size: 24.0,
                    color: ColorStyles.black100,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class _MentorListView extends StatelessWidget {
  const _MentorListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      itemBuilder: (context, idx) => Column(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            disabledColor: Colors.transparent,
            onPressed: () {
              Navigator.push(context, MentorDetailPage.route(1));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: ColorStyles.white400.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 8.0,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: _ProfileView(),
            ),
          ),
          const SizedBox(height: 16,)
        ],
      )
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({Key? key}) : super(key: key);

  final double width = 54;
  final double height = 54;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: "https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: ColorStyles.blue300,
                  borderRadius: BorderRadius.all(Radius.circular(width/2)),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      scale: 0.5
                  ),
                ),
              ),
              placeholder: (context, url) => Container(width: width, height: height,),
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "로건",
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.black1000
                  ),
                ),
                const SizedBox(height: 2,),
                Text(
                  "Google",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.black800
                  ),
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text(
                      "연구개발",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black100
                      ),
                    ),
                    Text(' ∙ '),
                    Text(
                      "AI",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black100
                      ),
                    ),
                    Text('  '),
                    Text(
                      "(3 ~ 4년차)",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black100
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12,),
        Text(
          '" 안녕하세요. Google 5년차 소프트웨어 엔지니어입니다. Google에 대해 궁금하신게 있으시다면 주저말고 연락주세요! "',
          style: TextStyle(
              fontSize: 16,
              height: 1.35,
              fontWeight: FontWeight.w500,
              color: ColorStyles.black500
          ),
        ),
      ],
    );
  }
}
