import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/bloc/main_tab_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/bloc/terms_of_service_bloc.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

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
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorStyles.black700,
        ),
        fontFamily: fontFamilyName,
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      home: BlocBuilder<AppBloc, AppState>(
        buildWhen: (pre, cur) {
          return pre.status != cur.status;
        },
        builder: (context, state) {
          switch (state.status) {
            case AppStatus.loading: // Splash
            case AppStatus.unAuth:
            case AppStatus.registering:
              return const LoginPage();
            case AppStatus.joined:
              return const MainTabPage();
          }
        }
      ),
    );
  }
}
