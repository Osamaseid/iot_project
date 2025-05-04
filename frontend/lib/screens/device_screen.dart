import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgets.dart';
import '../api/iot_service.dart';

class DeviceScreen extends StatefulWidget {
  static const routeName = "/device";
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  bool uv_light = false;
  bool sound = false;
  bool fan = false; // New state variable for the fan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Device")),
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
                        title: Text("UV Light"),
                        trailing: Switch(
                          value: uv_light,
                          onChanged: (value) async {
                            final prefs = await SharedPreferences.getInstance();
                            String token = await prefs.getString('token') ?? "";
                            IotService()
                                .toggle_uv(uv_state: value, token: token)
                                .then(
                              (_) {
                                setState(() {
                                  uv_light = value;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Anti-mosquito Sound"),
                        trailing: Switch(
                          value: sound,
                          onChanged: (value) async {
                            final prefs = await SharedPreferences.getInstance();
                            String token = await prefs.getString('token') ?? "";
                            IotService()
                                .toggle_sound(sound_state: value, token: token)
                                .then(
                              (_) {
                                setState(() {
                                  sound = value;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Fan"), // New ListTile for Fan
                        trailing: Switch(
                          value: fan,
                          onChanged: (value) async {
                            final prefs = await SharedPreferences.getInstance();
                            String token = await prefs.getString('token') ?? "";
                            IotService()
                                .toggle_fan(fan_state: value, token: token)
                                .then(
                              (_) {
                                setState(() {
                                  fan = value; // Update fan state
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://plus.unsplash.com/premium_photo-1723107368358-1cf57017d5a4?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                        SizedBox(height: 10),
                        Text('Mosquito Control Unit'),
                        Text("Device ID: MCU-001"),
                        Text("Status: Active"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 1),
    );
  }
}
