import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';
import 'package:mentos_flutter/src/presentation/page/chat_list/view/chat_list.dart';
import 'package:mentos_flutter/src/presentation/page/home/bloc/home_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/home/view/home.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/bloc/main_tab_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_main/view/mentor_main_page.dart';
import 'package:mentos_flutter/src/presentation/page/mypage/view/mypage.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';

class MainTabPage extends StatelessWidget {
  const MainTabPage({Key? key}) : super(key: key);

  static BlocProvider<MainTabBloc> show() {
    return BlocProvider(
      create: (context) => MainTabBloc(),
      child: const MainTabPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeBloc(
              postRepository: getIt.get<PostRepository>()
            )
              ..add(const HomeLoadPostListEvent())
        )
      ],
      child: _MainTabView()
    );
  }
}

class _MainTabView extends StatelessWidget {
  _MainTabView({Key? key}) : super(key: key);

  List<_MainTabPageInfo> pageInfoList = [
    _MainTabPageInfo(page: HomePage(), pageIconPath: "assets/images/home.png", pageName: '홈'),
    _MainTabPageInfo(page: MentorMainPage(), pageIconPath: "assets/images/users.png", pageName: '멘토'),
    // _MainTabPageInfo(page: ChatListPage(), pageIconPath: "assets/images/chat.png", pageName: '채팅'),
    _MainTabPageInfo(page: MyPagePage.show(), pageIconPath: "assets/images/mypage.png", pageName: '마이페이지'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTabBloc, MainTabState>(
      builder: (context, state) => WillPopScope(
          onWillPop: null,
          child: Scaffold(
            body: pageInfoList.elementAt(state.selectedIndex).page,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: backgroundColor.withOpacity(0.5),
              type: BottomNavigationBarType.fixed,
              elevation: 0.1,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: white,
              unselectedItemColor: black500,
              selectedLabelStyle: primaryB4,
              unselectedLabelStyle: primaryB4,
              items: pageInfoList.map<BottomNavigationBarItem>((v) =>
                  BottomNavigationBarItem(
                    icon: Image.asset(v.pageIconPath, height: 26, color: black400),
                    activeIcon: Image.asset(v.pageIconPath, height: 26, color: white),
                    label: v.pageName
                  )
              ).toList(),
              currentIndex: state.selectedIndex, // 지정 인덱스로 이동
              onTap: (idx) {
                context.read<MainTabBloc>().add(MainTabSelectedItem(selectedIndex: idx));
              }, // 선언했던 onItemTapped,
            ),
          )),
    );
  }
}

class _MainTabPageInfo {
  const _MainTabPageInfo({
    required this.page,
    required this.pageIconPath,
    required this.pageName
  });

  final Widget page;
  final String pageIconPath;
  final String pageName;
}