import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/router/app_router.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/bloc/main_tab_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/bloc/terms_of_service_bloc.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppBloc()),
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => TermsOfServiceBloc()),
          BlocProvider(create: (context) => MainTabBloc())
        ],
        child: const AppView()
    );
  }
}


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
