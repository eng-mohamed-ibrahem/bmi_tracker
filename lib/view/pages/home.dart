import 'package:bmi_tracker/view/pages/bottom_navigation/bmi_entries_view.dart';
import 'package:bmi_tracker/view/pages/bottom_navigation/bmi_tracker_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageStorageKey trackerKey = const PageStorageKey('MBITracker');
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
      MBITracker(
        key: trackerKey,
      ),
      BMIEntries(
        key: entriesKey,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
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
        ],
      ),
    );
  }
}
