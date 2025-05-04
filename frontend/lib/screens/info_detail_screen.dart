import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class InfoDetailScreen extends StatelessWidget {
  static const routeName = '/info-Detail';
  const InfoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = ModalRoute.of(context)!.settings.arguments as int;

    List<String> guidePaths = ["data/english.md", "data/amharic.md", "data/ormoifa.md"];

    return Scaffold(
      appBar: AppBar(title: Text("Malariya Prevention")),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString(guidePaths[selectedLanguage]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading Markdown file'));
          } else {
            debugPrint(snapshot.data);
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://plus.unsplash.com/premium_photo-1723107368358-1cf57017d5a4?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        // height: 600,
                        child: Markdown(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 16,
                          ),
                          controller: ScrollController(),
                          selectable: true,
                          shrinkWrap: true,
                          data: snapshot.data ?? "",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
