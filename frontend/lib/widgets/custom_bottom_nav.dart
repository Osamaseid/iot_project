import 'package:flutter/material.dart';

import '../screens/screens.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    List<String> pages = [
      Dashboard.routeName,
      DeviceScreen.routeName,
      AwernessScreen.routeName,
      SettingsScreen.routeName,
    ];
    return BottomNavigationBar(
      backgroundColor: Colors.black12,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        Navigator.pushReplacementNamed(context, pages[index]);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.device_hub), label: "Devices"),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: "Awerness"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
