

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/bloc/mentor_detail_bloc.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

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
      backgroundColor: ColorStyles.white,
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
                    _ProfileImage(),
                    const SizedBox(height: 24,),
                    _StatisticsView(),
                    const SizedBox(height: 24,),
                    _IntroductionView(),
                    const SizedBox(height: 24,),
                    _DescriptionView(),
                    const SizedBox(height: 24,),
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

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _StatisticsView extends StatelessWidget {
  const _StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _IntroductionView extends StatelessWidget {
  const _IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DescriptionView extends StatelessWidget {
  const _DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
            top: BorderSide(width: 1, color: ColorStyles.white200),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: ColorStyles.mainColor,
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
                      color: ColorStyles.white,
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CupertinoButton(
              color: state.isBookmarked ? ColorStyles.yellow.withAlpha(70) : ColorStyles.white,
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
                    color: state.isBookmarked ? ColorStyles.yellow : ColorStyles.white500,
                  )
                ),
                // child: Image.asset('assets/images/star.png', width: 24, color: ColorStyles.white600,)
                child: Image.asset(
                  'assets/images/star.png',
                  width: 24,
                  color: state.isBookmarked ? ColorStyles.yellow : ColorStyles.white600)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
