import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/data/dto/response/mentor/mentor_response.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/view/mentor_detail_page.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_main/bloc/mentor_main_bloc.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

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
      padding: EdgeInsets.fromLTRB(24, 8, 24, 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.1,
            color: white1000
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
                  borderRadius: BorderRadius.circular(8),
                  color: black800,
                  border: Border.all(
                      color: black500
                  )
              ),
              child: Row(
                children: [
                  Text(
                    '직군',
                    style: primaryB2
                  ),
                  Icon( // <-- Icon
                    Icons.arrow_drop_down_rounded,
                    size: 24.0,
                    color: white1000,
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
                  color: black800,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: black500
                  )
              ),
              child: Row(
                children: [
                  Text(
                      '년차',
                      style: primaryB2
                  ),
                  Icon( // <-- Icon
                    Icons.arrow_drop_down_rounded,
                    size: 24.0,
                    color: white1000,
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
    return BlocBuilder<MentorMainBloc, MentorMainState>(
      builder: (context, state) => ListView.builder(
        itemCount: state.list.length,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        itemBuilder: (context, idx) => Column(
          children: [
            _MentorProfileItemView(mentorProfile: state.list[idx],),
            const SizedBox(height: 16,)
          ],
        )
      ),
    );
  }
}


class _MentorProfileItemView extends StatelessWidget {
  const _MentorProfileItemView({
    Key? key,
    required this.mentorProfile
  }) : super(key: key);

  final MentorResponse mentorProfile;
  final double width = 54;
  final double height = 54;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      disabledColor: Colors.transparent,
      onPressed: () {
        Navigator.push(context, MentorDetailPage.route(1));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: black800,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: black500
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CachedNetworkImage(
                      width: width,
                      height: height,
                      imageUrl: mentorProfile.member.thumbnailUrl!,
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
                    const SizedBox(height: 6,),
                    Container(
                        constraints: BoxConstraints(minWidth: width, maxWidth: width),
                        alignment: Alignment.center,
                        child: Text(
                          mentorProfile.member.nickname,
                          style: customColorTextStyle(primaryB2, white1000),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                    ),
                  ],
                ),
                const SizedBox(width: 24,),
                Expanded(
                  child: Text(
                    '" ${mentorProfile.introduce} 그리고 여기저기서 많이 일해본 경험이 있습니다. "',
                    maxLines: 3,
                    style: customColorTextStyle(primaryB1, white500, height: 1.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 0.5, color: white1000)
                  ),
                  child: Text(mentorProfile.member.currentCorporationName!, style: customColorTextStyle(primaryB3, white800),),
                ),
                const SizedBox(width: 8,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    // color: red100,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 0.5, color: red500)
                  ),
                  child: Row(
                    children: [
                      Text(
                      '${mentorProfile.member.currentJobDetail!}  ${JobGroup.values[mentorProfile.jobGroup].korean}' ,
                        style: customColorTextStyle(primaryB3, red500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
