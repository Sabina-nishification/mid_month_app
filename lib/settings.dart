import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _selectedFontSize = 'Medium';
  String _selectedTheme = 'Dark';
  String _selectedLanguage = 'English';
  String _selectedAlignment = 'Left';
  String _notificationFrequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the entire background to black
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      body: Container(
        color: Colors.white, // Set the body background to white
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Preferences'),

            _buildDropdownTile('Theme', _selectedTheme, ['Light', 'Dark'], (value) {
              setState(() {
                _selectedTheme = value!;
              });
            }),

            _buildDropdownTile('Font Size', _selectedFontSize, ['Small', 'Medium', 'Large'], (value) {
              setState(() {
                _selectedFontSize = value!;
              });
            }),

            _buildDropdownTile('Text Alignment', _selectedAlignment, ['Left', 'Center', 'Right'], (value) {
              setState(() {
                _selectedAlignment = value!;
              });
            }),

            _buildDropdownTile('Language', _selectedLanguage, ['English', 'Spanish', 'French'], (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            }),

            Divider(color: Colors.grey),

            _buildSectionTitle('Notifications'),

            SwitchListTile(
              activeColor: Colors.blueAccent,
              title: Text('Enable Notifications', style: _settingsTextStyle()),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),

            _buildDropdownTile('Notification Frequency', _notificationFrequency, ['Daily', 'Weekly', 'Never'], (value) {
              setState(() {
                _notificationFrequency = value!;
              });
            }),

            Divider(color: Colors.grey),

            _buildSectionTitle('Account'),

            ListTile(
              leading: Icon(Icons.person, color: Colors.blueAccent),
              title: Text('Edit Profile', style: _settingsTextStyle()),
              onTap: () {
                // Navigate to profile editing page (to be implemented)
              },
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.redAccent),
              title: Text('Logout', style: _settingsTextStyle()),
              onTap: () {
                // Handle logout logic here
              },
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Section Titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  // Helper Widget for Dropdown Settings
  Widget _buildDropdownTile(String title, String value, List<String> options, ValueChanged<String?> onChanged) {
    return ListTile(
      title: Text(title, style: _settingsTextStyle()),
      trailing: DropdownButton<String>(
        dropdownColor: Colors.white,
        value: value,
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option, style: TextStyle(color: Colors.black)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  // Text Style for Settings Options
  TextStyle _settingsTextStyle() {
    return TextStyle(fontSize: 16.0, color: Colors.black);
  }
}
