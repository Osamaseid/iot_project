import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AwernessScreen extends StatefulWidget {
  static const routeName = "/awerness";
  const AwernessScreen({super.key});

  @override
  State<AwernessScreen> createState() => _AwernessScreenState();
}

class _AwernessScreenState extends State<AwernessScreen> {
  int currentChipIndex = 0;

  void updateCurrentIndex(int newIndex) {
    setState(() {
      currentChipIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Awerness")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Malaria Awareness",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateCurrentIndex(0);
                      },
                      child: Chip(
                        label: Text("English"),
                        backgroundColor:
                            (currentChipIndex == 0) ? Colors.blue : null,
                        labelStyle: TextStyle(color: (currentChipIndex == 0) ?  Colors.white : Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateCurrentIndex(1);
                      },
                      child: Chip(
                        label: Text("አማርኛ"),
                        backgroundColor:
                            (currentChipIndex == 1) ? Colors.blue : null,
                            labelStyle: TextStyle(color: (currentChipIndex == 1) ?  Colors.white : Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateCurrentIndex(2);
                      },
                      child: Chip(
                        label: Text("Afan Oromoo"),
                        backgroundColor:
                            (currentChipIndex == 2) ? Colors.blue : null,
                            labelStyle: TextStyle(color: (currentChipIndex == 2) ?  Colors.white : Colors.black),
                      ),
                    ),
                  ],
                ),
                InfographicCard(selectedLanguage: currentChipIndex,),
                InfographicCard(selectedLanguage: currentChipIndex,),
                InfographicCard(selectedLanguage: currentChipIndex,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 2),
    );
  }
}
