import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'history/history_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'report/report_page.dart';

class Dashboard extends ConsumerWidget {
  Dashboard({super.key});

  final _pages = [
    const HomePage(),
    const HistoryPage(),
    const ReportPage(),
    const ProfilePage(),
  ];

  final _pageController = PageController();

  final _currentPageProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          ref.read(_currentPageProvider.notifier).state = value;
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          // showUnselectedLabels: true,
          onTap: (value) {
            // Respond to item press.
            log('Bottom Nav Bar Item Pressed: $value');
            _pageController.jumpToPage(value);
            ref.read(_currentPageProvider.notifier).state = value;
          },
          currentIndex: ref.watch(_currentPageProvider),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
                activeIcon: Icon(Icons.history_edu)),
            BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: 'Report',
                activeIcon: Icon(Icons.report_gmailerrorred)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                activeIcon: Icon(Icons.person_outline)),
          ]),
    );
  }
}
