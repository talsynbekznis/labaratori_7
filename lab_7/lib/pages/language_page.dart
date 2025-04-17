import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Locale>(
        value: context.locale,
        items: [
          DropdownMenuItem(child: Text("Русский"), value: Locale('ru')),
          DropdownMenuItem(child: Text("English"), value: Locale('en')),
        ],
        onChanged: (locale) {
          if (locale != null) {
            context.setLocale(locale);
          }
        },
      ),
    );
  }
}