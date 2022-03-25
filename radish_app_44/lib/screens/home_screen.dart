import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:radish_app/screens/home/items_page.dart';
import 'package:radish_app/widget/expandablefab.dart';

//홈화면 클래스 생성(인스턴스)
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼평동', style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: IndexedStack(
        index: _bottomSelectedIndex,
        children: [
          ItemsPage(),
          Container(
            color: Colors.accents[8],
          ),
          Container(
            color: Colors.accents[9],
          ),
          Container(
            color: Colors.accents[10],
          ),
          Container(
            color: Colors.accents[11],
          ),
        ],
      ),
      floatingActionButton: ExpandableFab(
        distance: 90,
        children: [
          MaterialButton(onPressed: () {
            context.beamToNamed('input');
          },
          shape: CircleBorder(),
            height: 40,
            color: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add),
          ),
          MaterialButton(onPressed: () {
            context.beamToNamed('input');
          },
            shape: CircleBorder(),
            height: 40,
            color: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(_bottomSelectedIndex == 0
                    ? 'assets/icons/icon_home_select.png'
                    : 'assets/icons/icon_home_normal.png'),
              ),
              label: '홈'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(_bottomSelectedIndex == 1
                    ? 'assets/icons/icon_service_center_select.png'
                    : 'assets/icons/icon_service_center_normal.png'),
              ),
              label: '고객센터'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(_bottomSelectedIndex == 2
                    ? 'assets/icons/icon_category_select.png'
                    : 'assets/icons/icon_category_normal.png'),
              ),
              label: '카테고리'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(_bottomSelectedIndex == 3
                    ? 'assets/icons/icon_quote_consultation_select.png'
                    : 'assets/icons/icon_quote_consultation_normal.png'),
              ),
              label: '견적상담'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(_bottomSelectedIndex == 4
                    ? 'assets/icons/icon_myinfo_select.png'
                    : 'assets/icons/icon_myinfo_normal.png'),
              ),
              label: '내정보'),
        ],
        onTap: (index) {
          setState(() {
            _bottomSelectedIndex = index;
          });
        },
      ),
    );
  }
}
