import 'package:doctor_app/app/constants.dart';
import 'package:doctor_app/presentation/main/pages/appointments/view/appointments_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'pages/home/view/home_page.dart';
import 'pages/notifications/view/notifications_page.dart';
import 'pages/articles/view/articles_page.dart';
import 'pages/settings/view/settings_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomePage(),
    const AppointmentsPage(),
    const NotificationsPage(),
    const ArticlesPage(),
    const SettingsPage()
  ];
  List<String> titles = [
    AppStrings.doDoctor.tr(),
    AppStrings.myBookings.tr(),
    AppStrings.notifications.tr(),
    AppStrings.latestArticles.tr(),
    AppStrings.settings.tr(),
  ];

  var _title = AppStrings.doDoctor.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.call),
        onPressed: () {
          launcher.launch('tel:+${Constants.doctorPhone}');
        },
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined), label: AppStrings.doDoctor.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.date_range), label: AppStrings.myBookings.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.notifications_outlined),
                label: AppStrings.notifications.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.article_outlined),
                label: AppStrings.latestArticles.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: AppStrings.settings.tr()),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
