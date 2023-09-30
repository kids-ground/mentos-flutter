import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    Key? key,
    required this.label,
    required this.onSaved,
    required this.validator,
    this.hintText = "",
    this.helperText,
    this.isFilled = true,
    this.onEditingComplete,
    this.keyboardType,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
  }) : super(key: key);

  final String label;
  final String hintText;
  final String? helperText;
  final FormFieldSetter onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator validator;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isFilled;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.black500
              ),
            ),
          ],
        ),
        SizedBox(height: isFilled ? 8 : 0,),
        TextFormField(
          onSaved: onSaved,
          onChanged: onChanged,
          maxLines: maxLines,
          onEditingComplete: onEditingComplete,
          keyboardType: keyboardType,
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: ColorStyles.white200,
            filled: isFilled,
            counterText: "",
            hintText: hintText,
            helperText: helperText,
            helperStyle: const TextStyle(
              color: ColorStyles.mainColor,
              fontWeight: FontWeight.w600,
              fontSize: 14
            ),
            hintStyle: const TextStyle(
              color: ColorStyles.white900, // 플레이스홀더 텍스트 색상
            ),
            errorStyle: const TextStyle(
                fontSize: 12
            ),
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(8, 12, 4, 12),
            // 기본 색상
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.white200, width: 1.5),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.mainColor, width: 1.5),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.red1000, width: 1.5),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.red1000, width: 1.5),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
