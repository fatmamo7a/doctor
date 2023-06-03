import 'package:flutter/material.dart';

class LanguageSelectorPage extends StatefulWidget {
  const LanguageSelectorPage({super.key});

  @override
  LanguageSelectorPageState createState() => LanguageSelectorPageState();
}

class LanguageSelectorPageState extends State<LanguageSelectorPage> {
  final List<String> languagesList = ["English", "عربي"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select language"),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index) {
        return _buildLanguageItem(languagesList[index]);
      },
    );
  }

  _buildLanguageItem(String language) {
    return InkWell(
      onTap: () {
        print(language);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
