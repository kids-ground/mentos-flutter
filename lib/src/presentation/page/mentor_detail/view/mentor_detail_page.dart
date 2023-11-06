

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/data/dto/response/member/member_response.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_response.dart';
import 'package:mentos_flutter/src/data/repository/network/mentor_repository.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/bloc/mentor_detail_bloc.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

class MentorDetailPage extends StatelessWidget {
  const MentorDetailPage({Key? key}) : super(key: key);

  static Route<void> route(int mentorId) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => MentorDetailBloc(
          mentorRepository: getIt.get<MentorRepository>(),
          localKeyValueDataSource: getIt.get<LocalKeyValueDataSource>()
        )
          ..add(MentorDetailLoadMentorProfile(mentorId: mentorId))
        ,
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
    return BlocBuilder<MentorDetailBloc, MentorDetailState>(
      buildWhen: (pre, cur) => pre.mentorProfileResponse != cur.mentorProfileResponse,
      builder: (context, state) => Scaffold(
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
                        _ProfileView(mentor: state.mentorProfileResponse,),
                        const SizedBox(height: 32,),
                        _StatisticsView(mentor: state.mentorProfileResponse,),
                        const SizedBox(height: 32,),
                        _IntroductionView(mentor: state.mentorProfileResponse,),
                        const SizedBox(height: 32,),
                        _DescriptionView(mentor: state.mentorProfileResponse),
                        const SizedBox(height: 16,),
                      ],
                    )
                  ),
                ),
                const _ContactView()
              ],
            )
          ),
        )
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({
    Key? key,
    this.mentor
  }) : super(key: key);

  final double width = 64;
  final double height = 64;
  final MentorResponse? mentor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          width: width,
          height: height,
          imageUrl: mentor?.member.thumbnailUrl ?? "https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png",
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
            Text(
              mentor?.member.nickname ?? '',
              style: primaryT2,
            ),
            Row(
              children: [
                Text(
                  mentor?.member.currentCorporationName ?? '',
                  style: primaryB2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4,0,0,0),
                  // 인증 상태에 따라 인증 진행중일 수도 있음
                  child: Image.asset(
                    'assets/images/certification_mark.png',
                    width: 16,
                    height: 16,
                    color: Colors.green[400],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4,),

            Row(
              children: [
                Text(
                  "${mentor?.member.currentJobDetail ?? ''} ${JobGroup.values[mentor?.jobGroup ?? 0].korean}",
                  style: customColorTextStyle(primaryB2, black100),
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
  const _StatisticsView({
    Key? key,
    this.mentor
  }) : super(key: key);

  final MentorResponse? mentor;

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
                    color: black700,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blue500)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/palette.png', width: 26, color: blue300,),
                    const SizedBox(height: 4,),
                    Text(
                      "멘토링",
                      style: primaryB1,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "${mentor?.mentoringCount ?? 0}번",
                      style: primaryB1,
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
                    color: black700,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blue500)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/letter.png', width: 26, color: blue300,),
                    const SizedBox(height: 4,),
                    Text(
                      "리뷰",
                      style: primaryB1,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "${mentor?.reviewCount ?? 0}개",
                      style: primaryB1,
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
                    color: black700,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blue500)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/star.png', width: 26, color: blue300,),
                    const SizedBox(height: 4,),
                    Text(
                      "평점",
                      style: primaryB1,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "${mentor?.reviewScore ?? 0.0}",
                      style: primaryB1,
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
  const _IntroductionView({
    Key? key,
    this.mentor
  }) : super(key: key);

  final MentorResponse? mentor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '한 줄 인사',
          style: primaryT2,
        ),
        const SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: blue700,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
            mentor?.introduce ?? '',
            style: primaryB1,
          ),
        ),
      ],
    );
  }
}

class _DescriptionView extends StatelessWidget {
  const _DescriptionView({
    Key? key,
    this.mentor
  }) : super(key: key);

  final MentorResponse? mentor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '소개',
          style: primaryT2,
        ),
        const SizedBox(height: 12),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              color: black500,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text('${mentor?.description ?? ''}',
            style: primaryB2,
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
            top: BorderSide(width: 0.5, color: black500),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: mainColor,
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.read<MentorDetailBloc>().add(const MentorDetailOpenTalkLink());
                },
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
              color: state.isBookmarked ? yellow.withAlpha(70) : Colors.transparent,
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
                    color: state.isBookmarked ? yellow : black100,
                  )
                ),
                child: Image.asset(
                  'assets/images/star.png',
                  width: 24,
                  color: state.isBookmarked ? yellow : black100)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
