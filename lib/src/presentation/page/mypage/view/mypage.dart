import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/view/mentor_detail_page.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_profile_modify/view/mentor_profile_modify_page.dart';
import 'package:mentos_flutter/src/presentation/page/profile_modify/view/profile_modify_page.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class MyPagePage extends StatelessWidget {
  const MyPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MyPageView();
  }
}

class _MyPageView extends StatelessWidget {
  const _MyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '마이페이지'),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProfileInfo(),
              const SizedBox(height: 24,),
              const _MentorProfileInfo(),
              const SizedBox(height: 24,),
              const _ManagementSection(),
              const SizedBox(height: 24,),
              const _PersonalSection()
            ],
          ),
        )
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({Key? key}) : super(key: key);

  final double width = 50;
  final double height = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
            const Text(
              "로건",
              style: primaryT3,
            )
          ],
        ),

        CupertinoButton(
          padding: const EdgeInsets.all(0),
          disabledColor: Colors.transparent,
          minSize: 0,
          onPressed: () {
            Navigator.push(context, ProfileModifyPage.route());
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: white1000,
                )
            ),
            child: const Text(
                '프로필 수정',
                style: primaryB4
            ),
          ),
        )
      ],
    );
  }
}

class _MentorProfileInfo extends StatelessWidget {
  const _MentorProfileInfo({Key? key}) : super(key: key);
  // 멘토 프로필이 있냐 없냐에 따라 다르게 보여주기?

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: black700,
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        dense: true,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.topLeft,
          initiallyExpanded: true,
          iconColor: black100,
          collapsedIconColor: black100,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          ),
          title: const Text(
            '멘토 프로필',
            style: primaryT3,
          ),
          children: [
            buildJob(),
            const SizedBox(height: 8,),
            buildSummarize(),
            const SizedBox(height: 24,),
            buildIntroduction(),
            const SizedBox(height: 24,),
            buildButtonGroup(context)
          ],
        ),
      ),
    );
  }

  Widget buildJob() {
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,4,0),
              // 인증 상태에 따라 인증 진행중일 수도 있음
              child: Image.asset(
                'assets/images/certification_mark.png',
                width: 16,
                height: 16,
                color: Colors.green[300],
              ),
            ),
            Text(
              "Google",
              style: primaryB2,
            ),
          ],
        ),
        Text(' ∙ '),
        Text(
          "AI",
          style: primaryB2,
        ),
      ],
    );
  }

  Widget buildSummarize() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: black500,
                borderRadius: BorderRadius.circular(8),
                // border: Border.all(color: black100)
              ),
              child: Column(
                children: [
                  Text(
                    "멘토링",
                    style: primaryB2,
                  ),
                  Text(
                    "5번",
                    style: primaryB2,
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
                    color: black500,
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(color: white500)
                ),
                child: Column(
                  children: [
                    Text(
                      "리뷰",
                      style: primaryB2,
                    ),
                    Text(
                      "12개",
                      style: primaryB2,
                    ),
                  ],
                )
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    color: black500,
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(color: white500)
                ),
                child: Column(
                  children: [
                    Text(
                      "평점",
                      style: primaryB2,
                    ),
                    Text(
                      "4.5",
                      style: primaryB2,
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }

  Widget buildIntroduction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '한 줄 소개',
          style: primaryB2,
        ),
        const SizedBox(height: 4),
        Text(
          '안녕하세요 Google 5년차 소프트웨어 엔지니어입니다. Google에 대해 궁금하신게 있으시다면 주저말고 연락주세요!',
          style: primaryB3,
        ),
      ],
    );
  }

  Widget buildButtonGroup(BuildContext context) {
    // 상세보기 및 수정하기
    return Row(
      children: [
        Expanded(
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            disabledColor: Colors.transparent,
            onPressed: () {
              Navigator.push(context, MentorDetailPage.route(1));
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: white,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(
                  //   color: blue500,
                  // )
              ),
              child: const Text(
                  '상세보기',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                      decoration: null
                  )
              ),
            ),
          ),
        ),
        const SizedBox(width: 12,),
        Expanded(
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            disabledColor: Colors.transparent,
            onPressed: () {
              Navigator.push(context, MentorProfileModifyPage.route());
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(
                  //   color: blue500,
                  // )
              ),
              child: const Text(
                  '수정하기',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                      decoration: null
                  )
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ManagementSection extends StatelessWidget {
  const _ManagementSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "관리",
          style: primaryT2,
        ),
        const SizedBox(height: 8,),
        CupertinoListSection.insetGrouped(
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.zero,
          topMargin: 0,
          separatorColor: white,
          children: [
            CupertinoListTile(
              backgroundColor: black700,
              padding: EdgeInsets.symmetric(horizontal: 12),
              leading: Image.asset(
                'assets/images/star_line.png',
                width: 20,
                color: white,
              ),
              trailing: Icon(CupertinoIcons.chevron_forward, size: 16, color: white1000,),
              title: Text(
                "멘토 즐겨찾기",
                style: primaryB2,
              ),
            ),
            CupertinoListTile(
              backgroundColor: black700,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              leading: Image.asset(
                'assets/images/note_pencil_line.png',
                width: 24,
                color: white,
              ),
              title: Text(
                "내가 쓴 후기",
                style: primaryB2,
              ),
              trailing: Icon(CupertinoIcons.chevron_forward, size: 16, color: white1000,),
            ),
            CupertinoListTile(
                backgroundColor: black700,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                leading: Image.asset(
                  'assets/images/bell_line.png',
                  width: 24,
                  color: white,
                ),
                title: Text(
                  "알림",
                  style: primaryB2,
                ),
                trailing: CupertinoSwitch(value: true, onChanged: (bool value) {  },)
            ),
          ]
        ),
      ],
    );
  }
}

class _PersonalSection extends StatelessWidget {
  const _PersonalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "정보",
          style: primaryT2,
        ),
        const SizedBox(height: 8,),
        CupertinoListSection.insetGrouped(
            backgroundColor: Colors.transparent,
            margin: EdgeInsets.zero,
            topMargin: 0,
            separatorColor: Colors.transparent,
            children: [
              CupertinoListTile(
                padding: EdgeInsets.symmetric(horizontal: 12),
                backgroundColor: black700,
                leading: Image.asset(
                  'assets/images/shield_check_line.png',
                  width: 24,
                  color: white,
                ),
                title: Text(
                  "개인정보 처리방침",
                  style: primaryB2,
                ),
              ),
              CupertinoListTile(
                backgroundColor: black700,
                padding: EdgeInsets.symmetric(horizontal: 12),
                leading: Image.asset(
                  'assets/images/shield_check_line.png',
                  width: 24,
                  color: white,
                ),
                title: Text(
                  "서비스 이용약관",
                  style: primaryB2,
                ),
              ),
              CupertinoListTile(
                backgroundColor: black700,
                padding: EdgeInsets.symmetric(horizontal: 12),
                leading: Image.asset(
                  'assets/images/power_off_line.png',
                  width: 24,
                  color: white,
                ),
                title: Text(
                  "로그아웃",
                  style: primaryB2,
                ),
              ),
              CupertinoListTile(
                backgroundColor: black700,
                padding: EdgeInsets.symmetric(horizontal: 12),
                leading: Image.asset(
                  'assets/images/trash_line.png',
                  width: 24,
                  color: white,
                ),
                title: Text(
                  "회원탈퇴",
                  style: primaryB2,
                ),
              ),
            ]
        ),
      ],
    );
  }
}
