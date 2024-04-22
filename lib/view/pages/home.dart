import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/view/pages/bottom_navigation/bmi_entries_view.dart';
import 'package:bmi_tracker/view/pages/bottom_navigation/bmi_tracker_view.dart';
import 'package:bmi_tracker/view/pages/bottom_navigation/user_profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageStorageKey entriesKey = const PageStorageKey('BMIEntries');
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  late final List<Widget> screens;
  @override
  void initState() {
    screens = [
      const MBITracker(),
      BMIEntries(
        key: entriesKey,
      ),
      const UserProfile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentIndex == 0
            ? const Text('BMI Tracker')
            : currentIndex == 1
                ? const Text('Previous BMI Entries')
                : const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppMetrices.widthSpace),
        child: screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (tappedIndex) {
          setState(() {
            currentIndex = tappedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'BMI Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Entries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
