import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostello_assignment/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 60,
        onTap: navigationTapped,
        backgroundColor: Colors.white,
        currentIndex: _page,
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home_ostello.png')),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/teacher.png')),
            label: 'Batches',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const ImageIcon(AssetImage('assets/message.png')),
                Positioned(
                    right: 0,
                    top: -1,
                    child: Container(
                      padding: const EdgeInsets.all(3.5),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.5,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            label: 'Chat',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/profile_circle.png')),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
