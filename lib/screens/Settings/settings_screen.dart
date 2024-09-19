import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow for a smoother gradient effect

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue[900]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account settings
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            subtitle: const Text('Manage your account settings'),
            onTap: () {
              // Navigate to account settings
            },
          ),
          const Divider(),
          // Notifications settings
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Turn notifications on or off'),
            value: true, // This should be connected to a state or preference
            onChanged: (bool value) {
              // Handle switch change
            },
            secondary: const Icon(Icons.notifications),
          ),
          const Divider(),
          // Theme settings
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between light and dark theme'),
            trailing: Switch(
              value: false, // This should be connected to a state or preference
              onChanged: (bool value) {
                // Handle theme change
              },
            ),
          ),
          const Divider(),
          // Privacy settings
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            subtitle: const Text('Manage your privacy settings'),
            onTap: () {
              // Navigate to privacy settings
            },
          ),
          const Divider(),
          // About settings
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            subtitle: const Text('Learn more about this app'),
            onTap: () {
              // Navigate to about section
            },
          ),
        ],
      ),
    );
  }
}
