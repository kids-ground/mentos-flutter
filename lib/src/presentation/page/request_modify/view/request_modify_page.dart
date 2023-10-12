import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentos_flutter/src/presentation/page/request_modify/bloc/request_modify_bloc.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class RequestModifyPage extends StatelessWidget {
  const RequestModifyPage({Key? key}) : super(key: key);

  // 수정이냐 작성이냐에 따라 파라미터 달라짐
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => RequestModifyBloc(),
        child: const RequestModifyPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _RequestModifyView();
  }
}

// 제목, 글작성, 사진첨부(최대 3개), 태그(최대 2개)
class _RequestModifyView extends StatelessWidget {
  _RequestModifyView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RoutingAppBar(title: '멘토링 요청 작성',),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          onVerticalDragStart: (_) => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _TitleFormView(),
                    _TagFormView(),
                    const SizedBox(height: 12,),
                    _ContentFormView(),
                    const SizedBox(height: 16,),
                    _ImageListView()
                  ],
                ),
              )
            )
          )
        ),
      ),
    );
  }
}

class _TitleFormView extends StatelessWidget {
  const _TitleFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v){ },
      keyboardType: TextInputType.text,
      enableInteractiveSelection: true,
      maxLength: 30,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: '제목을 입력해주세요(30자 제한)',
        counterText: '',
        hintStyle: const TextStyle(
          color: ColorStyles.white900,
          fontWeight: FontWeight.w500,
          fontSize: 16
        ),
        errorStyle: const TextStyle(
            fontSize: 12
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        // 기본 색상
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
      ),
      validator: (v) { return null; },
    );
  }
}

class _TagFormView extends StatelessWidget {
  const _TagFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v){ },
      keyboardType: TextInputType.text,
      enableInteractiveSelection: true,
      maxLength: 30,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: '태그 작성 (최대 2개)',
        counterText: '',
        hintStyle: const TextStyle(
            color: ColorStyles.white900,
            fontWeight: FontWeight.w500,
            fontSize: 16
        ),
        errorStyle: const TextStyle(
            fontSize: 12
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        // 기본 색상
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
      ),
      validator: (v) { return null; },
    );
  }
}

class _ContentFormView extends StatelessWidget {
  const _ContentFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v){ },
      keyboardType: TextInputType.text,
      enableInteractiveSelection: true,
      maxLength: 200,
      maxLines: 15,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: '''내용을 입력해주세요. 구체적일수록 좋습니다.
        
ex) 백엔드 개발자 지망생입니다.  
Java와 Spring로 하나의 프로젝트를 만들어 봤습니다.
제 포트폴리오 보시고 피드백 해주실 멘토님 구해봅니다.

(200자 제한)''',
        hintStyle: const TextStyle(
            color: ColorStyles.white900,
            fontWeight: FontWeight.w500,
            fontSize: 16
        ),
        helperStyle: const TextStyle(
            color: ColorStyles.white900,
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
        errorStyle: const TextStyle(
            fontSize: 12
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        // 기본 색상
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyles.white200, width: 1),
        ),
      ),
      validator: (v) { return null; },
    );
  }
}

class _ImageListView extends StatelessWidget {
  const _ImageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton(
            onPressed: (){
              _selectImages(3);
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: ColorStyles.white300,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_camera, color: ColorStyles.black100, size: 30,),
                  Text(
                    '0/3',
                    style: TextStyle(
                      color: ColorStyles.black100,
                      fontSize: 14
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _selectImages(int maxCount) async {

    final imagePicker = ImagePicker();
    final List<XFile> selectedImages = await imagePicker.pickMultiImage(imageQuality: 50);

    if (selectedImages.isEmpty) return;
    if (selectedImages.length > maxCount) {

    } else {

    }
  }
}

class _SaveButtonView extends StatelessWidget {
  const _SaveButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
