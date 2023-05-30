import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/router/app_router.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorStyles.black700,
        ),
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      home: BlocBuilder<AppBloc, AppState>(
        buildWhen: (pre, cur) {
          return pre.status != cur.status && cur.status != AppStatus.registering;
        },
        builder: (context, state) {
          switch (state.status) {
            case AppStatus.loading:
            case AppStatus.unAuth:
            case AppStatus.registering:
              return const LoginPage();
            case AppStatus.joined:
              return MainTabPage();
          }
        }
      ),
    );
  }
}
