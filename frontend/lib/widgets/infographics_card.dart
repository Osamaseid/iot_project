import 'package:flutter/material.dart';

import '../screens/screens.dart';

class InfographicCard extends StatelessWidget {
  final int selectedLanguage;

  const InfographicCard({super.key, required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(InfoDetailScreen.routeName, arguments: selectedLanguage);
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 15,
        shadowColor: Colors.black38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://plus.unsplash.com/premium_photo-1723107368358-1cf57017d5a4?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Malaria Prevention',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Malaria is a life-threatening disease caused by Plasmodium parasites, which are transmitted to humans through the bites of infected female Anopheles mosquitoes. Symptoms include fever, chills, headache, and fatigue, often appearing 10–15 days after infection.",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
