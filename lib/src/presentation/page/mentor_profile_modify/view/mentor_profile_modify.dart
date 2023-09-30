

import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/presentation/widget/button/border_line_button.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_filled_button.dart';
import 'package:mentos_flutter/src/presentation/widget/text_field/default_text_from_field.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

class MentorProfileModifyPage extends StatelessWidget {
  MentorProfileModifyPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '멘토 프로필',
        centerTitle: true,
        fontSize: 20,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          visualDensity: VisualDensity.comfortable,
          padding: EdgeInsets.zero,
          color: ColorStyles.black100,
          onPressed: () {

          },
        )
      ),
      backgroundColor: ColorStyles.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        onVerticalDragStart: (_) => FocusScope.of(context).unfocus(),
        child: Container(
          color: ColorStyles.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildEmailForm(),
                  buildEmailVerifyForm(),
                  buildOpenChatLinkForm(),
                  buildJobGroupForm(),
                  buildJobDetailForm(),
                  buildIntroductionForm(),
                  buildDescriptionForm(),
                  buildSaveButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailForm() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DefaultTextFormField(
              label: '이메일',
              hintText: '현 직장 이메일을 입력하세요',
              isFilled: false,
              keyboardType: TextInputType.emailAddress,
              onSaved: (_){ },
              validator: (val) {
                if( (val?.length ?? 0) < 1) return '이메일은 필수사항입니다.';
                if(!RegExp(emailPattern).hasMatch(val ?? "")) return '잘못된 이메일 형식입니다.';
                return null;
              }
          ),
        ),
        const SizedBox(width: 16,),
        const Column(
          children: [
            SizedBox(height: 32,),
            BorderLineButton(
              title: '인증',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              onPressed: null,
              width: 60,
              height: 28,
            ),
          ],
        )
      ],
    );
  }

  Widget buildEmailVerifyForm() {
    return Visibility(
      visible: false,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTextFormField(
                    label: '이메일 - 인증확인',
                    hintText: '인증번호를 입력해주세요',
                    helperText: '3:00',
                    isFilled: false,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    onSaved: (_){ },
                    validator: (val){
                      if( (val?.length ?? 0) != 6) return '인증번호는 6자리 입니다';
                      return null;
                    }
                ),
              ),
              const SizedBox(width: 16,),
              const Column(
                children: [
                  SizedBox(height: 32,),
                  BorderLineButton(
                    title: '확인',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    onPressed: null,
                    width: 60,
                    height: 28,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOpenChatLinkForm() {
    return Column(
      children: [
        const SizedBox(height: 32,),
        DefaultTextFormField(
            label: '카톡 오픈채팅방 링크',
            hintText: '멘티와 소통할 수 있는 링크를 제공해주세요',
            onSaved: (_){},
            validator: (val){
              if(val.isEmpty ?? true) return '오픝채팅방 링크는 필수사항입니다.';
              if(!RegExp(kakaoOpenChatLinkPattern).hasMatch(val ?? ""))  return '잘못된 링크입니다.';
              return null;
            }
        ),
      ],
    );
  }

  Widget buildJobGroupForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32,),
        const Text(
          '직군',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: ColorStyles.black500
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: const InputDecoration(
            fillColor: ColorStyles.white200,
            filled: true,
            counterText: "",
            hintText: '직무를 선택하세요',
            hintStyle: TextStyle(
              color: ColorStyles.white900, // 플레이스홀더 텍스트 색상
            ),
            errorStyle: TextStyle(
                fontSize: 12
            ),
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(8, 10, 4, 10),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.white200, width: 1.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.mainColor, width: 1.5),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.red1000, width: 1.5),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.red1000, width: 1.5),
            ),
          ),
          items: jobGroupList.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          )).toList(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value?.isEmpty ?? true) return '직무를 선택해 주세요';
            return null;
          },
          onChanged: (value) { },
          onSaved: (value) { },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorStyles.black100,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ],
    );
  }

  Widget buildJobDetailForm() {
    return Column(
      children: [
        const SizedBox(height: 32,),
        DefaultTextFormField(
            label: '상세 직무',
            hintText: '상세 직무를 작성해주세요. ex) iOS 개발자',
            onSaved: (_){},
            validator: (val){ return null; }
        ),
      ],
    );
  }

  Widget buildIntroductionForm() {
    return Column(
      children: [
        const SizedBox(height: 32,),
        DefaultTextFormField(
            label: '한 줄 소개',
            hintText: '한 줄 소개',
            maxLength: 30,
            onSaved: (_){},
            validator: (val){
              if( (val?.length ?? 0) > 30) return '30자 제한입니다';
              return null;
            }
        ),
      ],
    );
  }

  Widget buildDescriptionForm() {
    return Column(
      children: [
        const SizedBox(height: 32,),
        DefaultTextFormField(
            label: '설명',
            hintText: '본인에 대해서 설명해주세요!',
            maxLines: 5,
            maxLength: 500,
            onSaved: (_){},
            validator: (val){
              if( (val?.length ?? 0) > 500) return '500자 제한입니다';
              return null;
            }
        ),
      ],
    );
  }

  Widget buildSaveButton() {
    return Column(
      children: [
        const SizedBox(height: 48,),
        FullFilledButton(
          title: '저장하기',
          height: 54,
          onPressed: (){

          }
        )
      ],
    );
  }
}
