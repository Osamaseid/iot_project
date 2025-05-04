import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Push Notifications"),
                        trailing: Switch(value: false, onChanged: (value) {}),
                      ),
                      ListTile(
                        title: Text("Temprature Alerts"),
                        trailing: Switch(value: false, onChanged: (value) {}),
                      ),
                      ListTile(
                        title: Text("Humidity Alert"),
                        trailing: Switch(value: false, onChanged: (value) {}),
                      ),
                      ListTile(
                        title: Text("Dark Mode"),
                        trailing: Switch(value: true, onChanged: (value) {}),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Device Information"),
                      Text("Model: MCU-001"),
                      Text("Firmware: v1.0.0"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 3),
    );
  }
}
