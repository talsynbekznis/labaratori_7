import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr())),
      body: Column(
        children: [
          ListTile(
            title: Text("Қазақша"),
            onTap: () => context.setLocale(Locale('kk')),
          ),
          ListTile(
            title: Text("Русский"),
            onTap: () => context.setLocale(Locale('ru')),
          ),
          ListTile(
            title: Text("English"),
            onTap: () => context.setLocale(Locale('en')),
          ),
        ],
      ),
    );
  }
}