

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

const logoH0 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 50,
    fontVariations: [
      FontVariation('wght', 800)
    ]
);

const logoH1 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 50,
    fontVariations: [
      FontVariation('wght', 400)
    ]
);

/* Head */
const primaryH0 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 32,
    fontVariations: [
      FontVariation('wght', 700)
    ]
);

const primaryH1 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 28,
    fontVariations: [
      FontVariation('wght', 700)
    ]
);

const primaryH2 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 24,
    fontVariations: [
      FontVariation('wght', 700)
    ]
);

const primaryH3 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 24,
    fontVariations: [
      FontVariation('wght', 600)
    ]
);


/* Subtitle */
const primaryT1 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 24,
    fontVariations: [
      FontVariation('wght', 700)
    ]
);


const primaryT2 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 22,
    fontVariations: [
      FontVariation('wght', 600)
    ]
);

const primaryT3 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 18,
    fontVariations: [
      FontVariation('wght', 600)
    ]
);

/* Body */
const primaryB1 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 18,
    fontVariations: [
      FontVariation('wght', 500)
    ]
);

const primaryB2 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 16,
    fontVariations: [
      FontVariation('wght', 500)
    ]
);

const primaryB3 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 15,
    fontVariations: [
      FontVariation('wght', 500)
    ]
);

const primaryB4 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 14,
    fontVariations: [
      FontVariation('wght', 500)
    ]
);

/* Caption */
const primaryC1 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 13,
    fontVariations: [
      FontVariation('wght', 400)
    ]
);

const primaryC2 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 12,
    fontVariations: [
      FontVariation('wght', 400)
    ]
);

const primaryC3 = TextStyle(
    color: white,
    fontFamily: variableFontFamilyName,
    fontSize: 10,
    fontVariations: [
      FontVariation('wght', 400)
    ]
);



/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  Custom Color Text Style
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
TextStyle customColorTextStyle(TextStyle style, Color color) {
  return TextStyle(
      color: color,
      fontFamily: style.fontFamily,
      fontSize: style.fontSize,
      fontVariations: style.fontVariations
  );
}