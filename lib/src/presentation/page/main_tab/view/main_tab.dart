import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/chat_list/view/chat_list.dart';
import 'package:mentos_flutter/src/presentation/page/home/bloc/home_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/home/view/home.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/bloc/main_tab_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_list/view/mentor_list.dart';
import 'package:mentos_flutter/src/presentation/page/setting/view/setting.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class MainTabPage extends StatelessWidget {
  MainTabPage({Key? key}) : super(key: key);

  final List<Widget> pageList = <Widget>[
    HomePage(),
    MentorListPage(),
    ChatListPage(),
    SettingPage()
  ];

  List<String> get itemImagePath => [
    "assets/images/home.png",
    "assets/images/users.png",
    "assets/images/chat.png",
    "assets/images/setting.png"
  ];

  Widget getItemImage({
    required int index,
    required bool isSelected
  }) => Image.asset(
    itemImagePath[index],
    height: 26,
    color: isSelected ? ColorStyles.black700 : ColorStyles.white800,
  );

  @override
  Widget build(BuildContext context) {
    final mainTabBloc = context.read<MainTabBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()..add(const HomeSelectCategory(selectedHomeCategroyId: 0)))
      ],
      child: BlocBuilder<MainTabBloc, MainTabState>(
        builder: (context, state) => WillPopScope(
          onWillPop: null,
          child: Scaffold(
            body: pageList.elementAt(state.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0.1,
              selectedItemColor: ColorStyles.black700,
              unselectedItemColor: ColorStyles.white800,
              selectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: getItemImage(index: 0, isSelected: false),
                  activeIcon: getItemImage(index: 0, isSelected: true),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: getItemImage(index: 1, isSelected: false),
                  activeIcon: getItemImage(index: 1, isSelected: true),
                  label: '멘토',
                ),
                BottomNavigationBarItem(
                  icon: getItemImage(index: 2, isSelected: false),
                  activeIcon: getItemImage(index: 2, isSelected: true),
                  label: '채팅',
                ),
                BottomNavigationBarItem(
                  icon: getItemImage(index: 3, isSelected: false),
                  activeIcon: getItemImage(index: 3, isSelected: true),
                  label: '설정',
                ),
              ],
              currentIndex: state.selectedIndex, // 지정 인덱스로 이동
              onTap: (idx) {
                mainTabBloc.add(MainTabSelectedItem(selectedIndex: idx));
              }, // 선언했던 onItemTapped,
            ),
          )),
      ),
    );
  }
}