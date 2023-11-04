

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/bloc/mentor_detail_bloc.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class MentorDetailPage extends StatelessWidget {
  const MentorDetailPage({Key? key}) : super(key: key);

  static Route<void> route(int mentorId) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => MentorDetailBloc(),
        child: const MentorDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _MentorDetailView();
  }
}

class _MentorDetailView extends StatelessWidget {
  const _MentorDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const RoutingAppBar(title: '멘토 상세',),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfileView(),
                    const SizedBox(height: 32,),
                    _StatisticsView(),
                    const SizedBox(height: 32,),
                    _IntroductionView(),
                    const SizedBox(height: 32,),
                    _DescriptionView(),
                    const SizedBox(height: 16,),
                  ],
                )
              ),
            ),
            const _ContactView()
          ],
        )
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({Key? key}) : super(key: key);

  final double width = 64;
  final double height = 64;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          width: width,
          height: height,
          imageUrl: "https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: blue300,
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
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: black1000
              ),
            ),
            Row(
              children: [
                Text(
                  "Google",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: black800
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4,0,0,0),
                  // 인증 상태에 따라 인증 진행중일 수도 있음
                  child: Image.asset(
                    'assets/images/certification_mark.png',
                    width: 16,
                    height: 16,
                    color: Colors.green[300],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  "연구개발",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black100
                  ),
                ),
                Text(' ∙ '),
                Text(
                  "AI",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: black100
                  ),
                ),
                Text('  '),
                Text(
                  "(3 ~ 4년차)",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black100
                  ),
                ),
              ],
            ),


          ],
        ),
      ],
    );
  }
}

class _StatisticsView extends StatelessWidget {
  const _StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blue500)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/palette.png', width: 26, color: blue300,),
                    const SizedBox(height: 4,),
                    Text(
                      "멘토링",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: black800
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "5번",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: black800
                      ),
                    ),
                  ],
                )
            ),
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blue500)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/letter.png', width: 26, color: blue300,),
                    const SizedBox(height: 4,),
                    Text(
                      "리뷰",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: black800
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "12개",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: black800
                      ),
                    ),
                  ],
                )
            ),
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blue500)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/star.png', width: 26, color: blue300,),
                    const SizedBox(height: 4,),
                    Text(
                      "평점",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: black800
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: black800
                      ),
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}

class _IntroductionView extends StatelessWidget {
  const _IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '한 줄 인사',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: black800
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: blue100,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
            '안녕하세요. Google 5년차 소프트웨어 엔지니어입니다. Google에 대해 궁금하신게 있으시다면 주저말고 연락주세요!',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: black500
            ),
          ),
        ),
      ],
    );
  }
}

class _DescriptionView extends StatelessWidget {
  const _DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '소개',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: black800
          ),
        ),
        const SizedBox(height: 12),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              color: white100,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text('''
간단하게 제 소개를 해볼게요ㅎㅎ

- 삼성 사내 벤쳐 스타트업 '앱플' 대표
- '애플'에 매각 
- 아이폰 15 디자인 리드
- 아이폰 16 디자인 리드 어쩌면?
- 구글 코리아 L4 엔지니어
- 구글 코리아 본부장 각

제 프로필을 보시고 궁금하신 점이 있으시다면 언제든 연락주세요  
            ''',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: black500
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactView extends StatelessWidget {
  const _ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MentorDetailBloc, MentorDetailState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: white200),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: mainColor,
                padding: EdgeInsets.zero,
                onPressed: () { },
                child: Container(
                  alignment: Alignment.center,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '연락하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: white,
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CupertinoButton(
              color: state.isBookmarked ? yellow.withAlpha(70) : white,
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<MentorDetailBloc>().add(MentorDetailEventBookmarked(isBookmarked: !state.isBookmarked));
              },
              child: Container(
                alignment: Alignment.center,
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: state.isBookmarked ? yellow : white500,
                  )
                ),
                child: Image.asset(
                  'assets/images/star.png',
                  width: 24,
                  color: state.isBookmarked ? yellow : white600)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
