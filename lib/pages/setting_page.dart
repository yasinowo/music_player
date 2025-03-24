import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('settigs'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryFixed,
            borderRadius: BorderRadius.circular(12),
          ), // BoxDecoration
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // dark mode
              const Text(
                "Dark Mode",
                style: TextStyle(fontWeight: FontWeight.bold),
              ), // Text

              // switch
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
              ), // CupertinoSwitch
            ],
          ), // Row
        ));
  }
}
