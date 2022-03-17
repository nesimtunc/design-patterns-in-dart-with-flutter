import 'package:design_patterns_in_dart_with_flutter/creational/singleton/user_settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode:',
                    style: Theme.of(context).textTheme.headline5),
                Switch(
                  value: UserSettings.instance.darkMode,
                  onChanged: (bool? newValue) => {
                    setState(() {
                      UserSettings.instance.darkMode = newValue!;
                    })
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
