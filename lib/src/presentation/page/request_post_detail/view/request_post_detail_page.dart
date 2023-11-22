import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/dto/response/post/comment_response.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_response.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';
import 'package:mentos_flutter/src/domain/service/notification_service.dart';
import 'package:mentos_flutter/src/presentation/page/request_post_detail/bloc/request_post_detail_bloc.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/constant/date.dart';

class RequestPostDetailPage extends StatelessWidget {
  const RequestPostDetailPage({Key? key}) : super(key: key);

  static Route<void> route(int postId) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => RequestPostDetailBloc(
          postRepository: getIt.get<PostRepository>(),
          notificationService: getIt.get<NotificationService>()
        )
          ..add(RequestPostDetailLoadPost(postId: postId))
          ..add(RequestPostDetailLoadCommentList(postId: postId))
        ,
        child: const RequestPostDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _RequestPostDetailView();
  }
}

class _RequestPostDetailView extends StatelessWidget {
  _RequestPostDetailView({Key? key}) : editingController = TextEditingController(), super(key: key);
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestPostDetailBloc, RequestPostDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: RoutingAppBar(title: '${state.post?.writer?.nickname}님의 요청글',),
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              onVerticalDragStart: (_) => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  Expanded(child: _ContentListView()),
                  _CommentFormView(editingController: editingController)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContentListView extends StatelessWidget {
  const _ContentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestPostDetailBloc, RequestPostDetailState>(
      buildWhen: (pre, cur) => pre.post != cur.post || pre.commentList != cur.commentList,
      builder: (context, state) => ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: state.commentList.length + 1,
        itemBuilder: (context, index) =>
            index == 0 ?
              (state.post != null ? _PostItem(post: state.post!,) : Container()) :
            _CommentItem(comment: state.commentList[index - 1],)
        )
    );
  }
}


class _PostItem extends StatelessWidget {
  const _PostItem({
    Key? key,
    required this.post
  }) : super(key: key);

  final PostResponse post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black800,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTagView(),
                const SizedBox(height: 8,),
                _buildContentView(),
                const SizedBox(height: 48,),
                _buildDateView(),
                const SizedBox(height: 16,),
                _buildMoreView(),
              ],
            ),
          ),
          Container(height: 16, color: backgroundColor,),
        ],
      ),
    );
  }

  Widget _buildTagView() {
    return Row(
      children: post.tags.map((v) =>
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: red100,
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Text(
                  '#${v}',
                  style: customColorTextStyle(primaryB4, red1000),
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
                  post.title,
                  overflow: TextOverflow.visible,
                  style: primaryT1,
                ),
                const SizedBox(height: 24,),
                Text(
                  post.description,
                  overflow: TextOverflow.visible,
                  style: customColorTextStyle(primaryB1, null, height: 1.7),
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
        timeAgo(post.createdAt),
        style: customColorTextStyle(primaryB4, white1000),
      ),
    );
  }

  Widget _buildMoreView() {
    return Row(
      children: [
        Image.asset('assets/images/eye.png', width: 20, color: white800,),
        const SizedBox(width: 6,),
        Text('${post.hit ?? 0}', style: customColorTextStyle(primaryB2, white1000),),
        const SizedBox(width: 32,),
        Image.asset('assets/images/chat_dots.png', width: 20, color: white800,),
        const SizedBox(width: 6,),
        Text('${post.commentCount ?? 0}', style: customColorTextStyle(primaryB2, white1000),),
      ],
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({
    Key? key,
    required this.comment
  }) : super(key: key);

  final CommentResponse comment;
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
          imageUrl: comment.writer.thumbnailUrl!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: blue300,
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
            Text(comment.writer.nickname, style: primaryB1,),
            const SizedBox(height: 2,),
            Text(
              '${comment.writer.currentCorporationName} • ${comment.writer.currentJobDetail}',
              style: customColorTextStyle(primaryB4, white1000),
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
          child: Text.rich(
            TextSpan(
              children: [
                if (comment.taggedMember != null)
                  TextSpan(
                    text: '@${comment.taggedMember!.nickname} ',
                    style: customColorTextStyle(primaryB1, blue700),
                  ),
                TextSpan(
                  text: comment.content,
                  style: customColorTextStyle(primaryB1, white300),
                ),
              ]
            )
          )
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
            context.read<RequestPostDetailBloc>().add(RequestPostDetailCommentReply(taggedMember: comment.writer));
          },
          padding: EdgeInsets.zero,
          minSize: 0,
          child: Text('답글쓰기', style: customColorTextStyle(primaryB4, black100))
        ),
        const SizedBox(width: 6,),
        Text('•',style: customColorTextStyle(primaryB4, black100)),
        const SizedBox(width: 6,),
        Text(timeAgo(comment.createdAt), style: customColorTextStyle(primaryB4, black100)),
      ],
    );
  }
}

class _CommentFormView extends StatelessWidget {
  _CommentFormView({
    Key? key,
    required this.editingController
  }) : super(key: key);

  final double replyImageWidth = 20;
  final double replyImageHeight = 20;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestPostDetailBloc, RequestPostDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            const Divider(thickness: 0.5, color: black700, height: 0.5,),

            if (state.taggedMember != null)
              Container(
                margin: const EdgeInsets.fromLTRB(24, 8, 0, 0),
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
                        imageUrl: state.taggedMember!.thumbnailUrl!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            color: blue300,
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
                        state.taggedMember!.nickname,
                        textAlign: TextAlign.center,
                        style: customColorTextStyle(primaryB2, white500),
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        '님에게 답장 중',
                        style: customColorTextStyle(primaryB2, white500),
                      ),

                      const SizedBox(width: 6,),
                      Icon(Icons.cancel, size: 16, color: white900,)
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
                        color: white200
                    ),
                    margin: const EdgeInsets.fromLTRB(24, 12, 0, 8),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: editingController,
                      onChanged: (text) {
                        context.read<RequestPostDetailBloc>().add(RequestPostDetailCommentWrite(comment: text));
                      },
                      maxLength: 100,
                      minLines: 1,
                      maxLines: 3,
                      style: primaryB2,
                      cursorColor: white1000,
                      decoration: InputDecoration(
                        fillColor: black500,
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        counterText: '',
                        contentPadding: EdgeInsets.only(
                            left: 16, bottom: 10, top: 10, right: 16),
                        hintText: '댓글을 작성해주세요',
                        hintStyle: TextStyle(color: white1000),
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: state.canSend ? () {
                    final commentText = editingController.text;
                    context.read<RequestPostDetailBloc>().add(RequestPostDetailCommentSend(commentText: commentText));
                    FocusScope.of(context).unfocus();
                    editingController.text = "";
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
                      color: state.canSend ? blue700  : black700,
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
