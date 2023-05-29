import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/app/view/app_view.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/bloc/main_tab_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/bloc/terms_of_service_bloc.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

void main() {
  // 여기서 member 확인??
  // 확인하고 MyApp에 AppStatus 넘겨주기 joined or unAuth
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => TermsOfServiceBloc()),
        BlocProvider(create: (context) => MainTabBloc())
      ],
      child: AppView()
    );
  }
}