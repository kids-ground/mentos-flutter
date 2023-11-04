import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentos_flutter/src/presentation/page/request_modify/bloc/request_modify_bloc.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/routing_app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

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

class _RequestModifyView extends StatelessWidget {
  _RequestModifyView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoutingAppBar(title: '멘토링 요청 작성',),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          onVerticalDragStart: (_) => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            child: CustomScrollView(
              physics: const RangeMaintainingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: const Column(
                    children: [
                      _TitleFormView(),
                      _TagFormView(),
                      SizedBox(height: 12,),
                      _ContentFormView(),
                      SizedBox(height: 16,),
                      // _ImageListView(),
                      SizedBox(height: 32,),
                      Spacer(),
                      _SaveButtonView(),
                      SizedBox(height: 24,),
                    ],
                  ),
                )
              ],
            ),
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
      onChanged: (v){
        context.read<RequestModifyBloc>().add(RequestModifyTitle(title: v));
      },
      keyboardType: TextInputType.text,
      enableInteractiveSelection: true,
      maxLength: 30,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: primaryB1,
      decoration: InputDecoration(
        hintText: '제목을 입력해주세요(30자 제한)',
        counterText: '',
        hintStyle: const TextStyle(
          color: white900,
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
          borderSide: BorderSide(color: black500, width: 0.1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 0.1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 0.1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 0.1),
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
      onChanged: (v) {
        // 띄어쓰기당 태그하나 - UI로 그리기
        context.read<RequestModifyBloc>().add(RequestModifyTagList(tagList: v.split(' ')));
      },
      keyboardType: TextInputType.text,
      enableInteractiveSelection: false,
      maxLength: 20,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: primaryB1,
      decoration: InputDecoration(
        hintText: '태그 작성 최대 2개 ex) #주니어',
        counterText: '',
        hintStyle: const TextStyle(
            color: white900,
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
          borderSide: BorderSide(color: black500, width: 0.1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 0.1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 0.1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 0.1),
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
      onChanged: (v){
        context.read<RequestModifyBloc>().add(RequestModifyContent(content: v));
      },
      keyboardType: TextInputType.multiline,
      enableInteractiveSelection: true,
      maxLength: 200,
      maxLines: 15,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: primaryB1,
      decoration: InputDecoration(
        hintText: '''내용을 입력해주세요. 구체적일수록 좋습니다.
        
ex) 백엔드 개발자 지망생입니다.  
Java와 Spring로 하나의 프로젝트를 만들어 봤습니다.
제 포트폴리오 보시고 피드백 해주실 멘토님 구해봅니다.

(200자 제한)''',
        hintStyle: const TextStyle(
            color: white900,
            fontWeight: FontWeight.w500,
            fontSize: 16
        ),
        helperStyle: const TextStyle(
            color: white900,
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
          borderSide: BorderSide(color: black500, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 1),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: black500, width: 1),
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
                color: white300,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_camera, color: black100, size: 30,),
                  Text(
                    '0/3',
                    style: TextStyle(
                      color: black100,
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
    if (selectedImages.length > maxCount) {}
    else { }
  }
}

class _SaveButtonView extends StatelessWidget {
  const _SaveButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestModifyBloc, RequestModifyState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CupertinoButton(
            color: mainColor,
            padding: EdgeInsets.zero,
            disabledColor: disableBackgroundColor,
            onPressed: state.canComplete ? () { } : null,
            child: Container(
              alignment: Alignment.center,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                  '작성 완료',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: white,
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
