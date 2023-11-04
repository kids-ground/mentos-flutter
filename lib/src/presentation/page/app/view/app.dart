import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/launch/view/launch_page.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(testRepository: getIt.get<TestRepository>()),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: fontFamilyName,
        brightness: Brightness.light,
        scaffoldBackgroundColor: backgroundColor,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: backgroundColor,
          foregroundColor: white
        ),
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: black700,
          background: white
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
            case AppStatus.init: // Splash
              return LaunchPage.show();
            case AppStatus.unAuth:
              return LoginPage.show();
            case AppStatus.joined:
              return MainTabPage.show();
          }
        }
      ),
    );
  }
}
