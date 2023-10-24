import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/request_post_detail/bloc/request_post_detail_bloc.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class RequestPostDetailPage extends StatelessWidget {
  const RequestPostDetailPage({Key? key}) : super(key: key);

  static Route<void> route(int postId) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => RequestPostDetailBloc(),
        child: const RequestPostDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _RequestPostDetailView();
  }
}

class _RequestPostDetailView extends StatelessWidget {
  const _RequestPostDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoutingAppBar(title: '로건님의 요청글',),
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          onVerticalDragStart: (_) => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(child: _ContentListView()),
              _CommentFormView()
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentListView extends StatelessWidget {
  const _ContentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, index) =>
            index == 0 ? _PostItem() : _CommentItem()
    );
  }
}


class _PostItem extends StatelessWidget {
  const _PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // _buildProfileAndDateView(),
          // const SizedBox(height: 40,),
          _buildTagView(),
          const SizedBox(height: 4,),
          _buildContentView(),
          const SizedBox(height: 32,),
          _buildDateView(),
          const SizedBox(height: 16,),
          _buildMoreView(),
          const SizedBox(height: 24,),

        ],
      ),
    );
  }

  Widget _buildProfileAndDateView() {
    const double width = 40;
    const double height = 40;
    return Row(
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
        const SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '로건',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black1000
              ),
            ),
            Text(
              '32분 전',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.white1000
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTagView() {
    return Row(
      children: ['신입', '백엔드'].map((v) =>
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: ColorStyles.red100,
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text(
                  '#${v}',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.red1000
                  ),
                ),
              ),
              const SizedBox(width: 6,)
            ],
          )
      ).toList(),
    );
  }

  Widget _buildContentView() {
    return Row(
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
                  '흔한 신입개발자의 고민을 풀어주실 멘토님을 구합니다!',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.black1000
                  ),
                ),
                const SizedBox(height: 24,),
                Text(
                  '흔한 신입개발자입니다. 앞으로 어떤 공부를 하면 좋을지 어떤 방향으로 나아가는게 좋을지 너무 많은 것이 궁금합니다. 제 커리어 방향성을 함께 논의해주실 멘토님 계실까요?',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.black500,
                      height: 1.5
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateView() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '32분 전',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorStyles.white1000
        ),
      ),
    );
  }

  Widget _buildMoreView() {
    return Row(
      children: [
        Image.asset('assets/images/eye.png', width: 20, color: ColorStyles.white800,),
        const SizedBox(width: 6,),
        Text(
          '17',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorStyles.white1000
          ),
        ),
        const SizedBox(width: 32,),
        Image.asset('assets/images/chat_dots.png', width: 20, color: ColorStyles.white800,),
        const SizedBox(width: 6,),
        Text(
          '2',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorStyles.white1000
          ),
        ),
      ],
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({Key? key}) : super(key: key);

  final double imageWidth = 40;
  final double imageHeight = 40;
  final double imageInterval = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileView(),
          const SizedBox(height: 10,),
          _buildCommentContentView(),
          const SizedBox(height: 12,),
          _buildMoreView(context)
        ],
      ),
    );
  }

  Widget _buildProfileView() {
    return Row(
      children: [
        CachedNetworkImage(
          width: imageWidth,
          height: imageHeight,
          imageUrl: "https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: ColorStyles.blue300,
              borderRadius: BorderRadius.all(Radius.circular(imageWidth/2)),
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  scale: 0.5
              ),
            ),
          ),
          placeholder: (context, url) => Container(width: imageWidth, height: imageHeight,),
        ),
        SizedBox(width: imageInterval,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '록록',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.black1000
              ),
            ),
            const SizedBox(height: 0,),
            Text(
              '네이버 • 백엔드 개발자',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black300
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCommentContentView() {
    return Row(
      children: [
        SizedBox(width: imageWidth + imageInterval,),
        Expanded(
          child: Text(
            '훌륭한 마인드를 가지고 계시군요. 제가 아직 조언을 해드릴 짬은 아니라 응원 메시지만 남기고 갑니다. 화이팅!!',
            style: TextStyle(
                color: ColorStyles.black500,
                fontWeight: FontWeight.w500,
                fontSize: 17
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMoreView(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: imageWidth + imageInterval,),
        CupertinoButton(
          onPressed: () {
            context.read<RequestPostDetailBloc>().add(RequestPostDetailCommentReply(commentId: 1));
          },
          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
          minSize: 0,
          child: Row(
            children: [
              Text(
                  '답글쓰기',
                  style: TextStyle(
                      color: ColorStyles.white1000,
                      fontSize: 14
                  )
              )
            ],
          ),
        ),
        const SizedBox(width: 6,),
        Text('•', style: TextStyle(
            color: ColorStyles.white300,
            fontSize: 14
        )),
        const SizedBox(width: 6,),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
              '21분 전',
              style: TextStyle(
                  color: ColorStyles.white1000,
                  fontSize: 14
              )
          ),
        ),
      ],
    );
  }
}

class _CommentFormView extends StatelessWidget {
  const _CommentFormView({Key? key}) : super(key: key);

  final double replyImageWidth = 20;
  final double replyImageHeight = 20;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestPostDetailBloc, RequestPostDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            Divider(thickness: 0.5, color: ColorStyles.white500, height: 0.5,),


            if (state.replyCommentId != 0)
              Container(
                margin: EdgeInsets.fromLTRB(24, 8, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4)
                ),
                child: CupertinoButton(
                  onPressed: () {
                    context.read<RequestPostDetailBloc>().add(const RequestPostDetailCommentReplyCancel());
                  },
                  padding: EdgeInsets.symmetric(vertical: 4),
                  minSize: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        width: replyImageWidth,
                        height: replyImageHeight,
                        imageUrl: "https://images.velog.io/images/chang626/post/c9533c4f-adbb-4411-bce4-b09293d64fbf/A03EACB4-4DFA-439A-A3FE-084635A89FE6.png",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            color: ColorStyles.blue300,
                            borderRadius: BorderRadius.all(Radius.circular(replyImageWidth/2)),
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                scale: 0.5
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(width: replyImageWidth, height: replyImageHeight,),
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        'rokwon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorStyles.black700,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        '님에게 답장 중',
                        style: TextStyle(
                            color: ColorStyles.black700,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),

                      const SizedBox(width: 6,),
                      Icon(Icons.cancel, size: 16, color: ColorStyles.white900,)
                    ],
                  ),
                ),
              ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorStyles.white200
                    ),
                    margin: const EdgeInsets.fromLTRB(24, 6, 0, 8),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      onChanged: (text) {
                        context.read<RequestPostDetailBloc>().add(RequestPostDetailCommentWrite(comment: text));
                      },
                      maxLength: 100,
                      minLines: 1,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        counterText: '',
                        contentPadding: EdgeInsets.only(
                            left: 16, bottom: 10, top: 10, right: 16),
                        hintText: '댓글을 작성해주세요',
                        hintStyle: TextStyle(color: ColorStyles.white1000)
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: state.canSend ? () {

                  } : null,
                  padding: EdgeInsets.zero,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0,6,0,8),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(12, 12, 24, 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.send_rounded,
                      color: state.canSend ? ColorStyles.mainColor : ColorStyles.disableBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
