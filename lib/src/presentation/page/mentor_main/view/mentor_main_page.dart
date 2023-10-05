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
      appBar: const CommonAppBar(title: '멘토',),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: ColorStyles.white200,
          child: const _MentorListView()
        ),
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
    return Row(
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
          Text(
            "Google",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorStyles.black800
            ),
          ),
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
    );
  }
}
