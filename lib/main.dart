import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/bloc/terms_of_service_bloc.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

void main() {
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => TermsOfServiceBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorStyles.black100),
          fontFamily: 'Pretendard',
          useMaterial3: true,
        ),
        home: const LonginPage(),
      ),
    );
  }
}