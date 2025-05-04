import "package:flutter/material.dart";

import '../screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp",
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        Dashboard.routeName: (context) => Dashboard(),
        DeviceScreen.routeName: (context) => DeviceScreen(),
        AwernessScreen.routeName: (context) => AwernessScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        InfoDetailScreen.routeName: (context) => InfoDetailScreen(),
      },
    );
  }
}
