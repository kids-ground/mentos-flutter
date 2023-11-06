

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/repository/network/image_repository.dart';
import 'package:mentos_flutter/src/data/repository/network/member_repository.dart';
import 'package:mentos_flutter/src/presentation/page/profile_modify/bloc/profile_modify_bloc.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_filled_button.dart';
import 'package:mentos_flutter/src/presentation/widget/dialog/loading_dialog.dart';
import 'package:mentos_flutter/src/presentation/widget/text_field/default_text_from_field.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

class ProfileModifyPage extends StatelessWidget {
  const ProfileModifyPage({Key? key}) : super(key: key);

  // 수정이냐 작성이냐에 따라 파라미터 달라짐
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => ProfileModifyBloc(
          memberRepository: getIt.get<MemberRepository>(),
          imageRepository: getIt.get<ImageRepository>(),
        )..add(const ProfileModifyGetProfile()),
        child: const ProfileModifyPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileModifyBloc, ProfileModifyState>(
      listenWhen: (pre, cur) => pre.loadingStatus != cur.loadingStatus,
      listener: (pre, cur) {
        switch (cur.loadingStatus) {
          case LoadingStatus.loading:
            showLoadingDialog(context);
          case LoadingStatus.success:
            // showSimpleSnackBar(context, '수정이 완료되었습니다');
            Navigator.pop(context);
            Navigator.pop(context);
          case LoadingStatus.failure:
            Navigator.pop(context);
          default:
            return;
        }
      },
      child: const _ProfileModifyView()
    );
  }
}

class _ProfileModifyView extends StatelessWidget {
  const _ProfileModifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RoutingAppBar(title: '프로필 수정',),
      body: SafeArea(
        child: CustomScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: <Widget>[
                    const _ImageSelectView(),
                    const SizedBox(height: 36,),
                    _NicknameChangeView(),
                    const Spacer(),
                    const _SaveButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageSelectView extends StatelessWidget {
  // 이미지 등록 시 바로 저장되도록
  const _ImageSelectView({Key? key}) : super(key: key);

  final double width = 160;
  final double height = 160;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileModifyBloc, ProfileModifyState>(
      builder: (context, state) => Stack(
        clipBehavior: Clip.none,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            disabledColor: Colors.transparent,
            onPressed: () { _selectImage(context); },
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: white300,
                borderRadius: BorderRadius.circular(width/2),
                border: Border.all(
                  color: white800,
                )
              ),
              child: _showImageConditional(context, state)
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: white500,
              child: IconButton(
                onPressed: () { _selectImage(context); },
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add_a_photo, size: 22, color: black200,),
              ),
            ))
        ],
      ),
    );
  }

  Future<void> _selectImage(BuildContext context) async {
    XFile? xfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (xfile != null) {
       File file = File(xfile.path);
       context.read<ProfileModifyBloc>()
           .add(ProfileModifySelectedImage(image: file));
    }
  }

  Widget _showImageConditional(BuildContext context, ProfileModifyState state) {
    if (state.newProfileImageFile != null) {
      return _buildLocalImage(state.newProfileImageFile!);
    } else if (state.memberResponse?.thumbnailUrl != null) {
      return _buildNetworkImage(context, state.memberResponse!.thumbnailUrl!);
    } else {
      return _buildDefaultImage();
    }
  }

  Widget _buildLocalImage(File file) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.file(file).image, fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(width/2)),
      ),
    );
  }

  Widget _buildNetworkImage(BuildContext context, String imageUrl) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
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
    );
  }

  Widget _buildDefaultImage() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: white200,
        borderRadius: BorderRadius.all(Radius.circular(width/2)),
      ),
    );
  }
}

class _NicknameChangeView extends StatelessWidget {
  _NicknameChangeView({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileModifyBloc, ProfileModifyState>(
      listenWhen: (pre, cur) => pre.memberResponse?.nickname != cur.memberResponse?.nickname,
      listener: (pre, cur) {
        _controller.text = cur.memberResponse?.nickname ?? "";
      },
      child: DefaultTextFormField(
          label: '닉네임',
          hintText: '닉네임을 입력해주세요',
          controller: _controller,
          maxLength: 8,
          onSaved: (v) {
            _controller.text = v;
          },
          onChanged: (v) {
            context.read<ProfileModifyBloc>().add(ProfileModifyNickname(nickname: v));
          },
          validator: (v) {
            if (v.length < 2) {
              return '2자 이상이어야 합니다';
            }
            return null;
          }
        )
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullFilledButton(
        height: 52,
        title: '저장하기',
        onPressed: () {
          context.read<ProfileModifyBloc>().add(const ProfileModifySave());
        }
    );
  }
}
