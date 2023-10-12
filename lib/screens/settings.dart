import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // Define the light theme
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      // Define the dark theme
      brightness: Brightness.dark,
    ),
    home: SettingsPage(),
  ));
}

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false; // Initial dark mode state

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkModeEnabled = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCAC19A),
        title: Text('Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
      ),
      body: Container(
        color: Color(0xFFFFFBF3),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Notifications'),
              subtitle: Text('Enable or disable notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement language selection logic
              },
            ),
            ListTile(
              title: Text('Dark Mode'),
              subtitle: Text('Enable or disable dark mode'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: toggleDarkMode,
              ),
            ),
            ListTile(
              title: Text('Language'),
              subtitle: Text('Select your preferred language'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement language selection logic
              },
            ),
            Divider(),
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement navigation to the privacy policy page
              },
            ),
            ListTile(
              title: Text('Terms of Service'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement navigation to the terms of service page
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Implement logout logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
