  import 'package:flutter/material.dart';

  import 'package:provider/provider.dart';

  import '../provider/UiProvider.dart';

  class SettingScreen extends StatefulWidget {

    final String title;

    const SettingScreen({super.key, required this.title});

    @override
    State<SettingScreen> createState() => _SettingScreenState();
  }

  class _SettingScreenState extends State<SettingScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<UiProvider>(
          builder: (context, UiProvider notifier, child) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    notifier.isDark ? Icons.dark_mode : Icons.light_mode,
                  ),
                  title: Text("Toggle Theme"),
                  trailing: Switch(
                    onChanged: (value) {
                      notifier.changeTheme(); },
                    value: notifier.isDark,
                  ),
                )
              ],
            );
          },
        ),
      );
    }
  }