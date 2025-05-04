import 'package:flutter/material.dart';
//import 'package:settings_ui/settings_ui.dart';  // Required for settings UI components




import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // General settings section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("General",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 12),
          ListTile(
            title: Text("Sound Alerts"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.volume_up),
            onTap: () {
              // Handle sound alerts toggle logic here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Sound alerts setting")),
              );
            },
          ),
          ListTile(
            title: Text("Dark Mode"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.dark_mode),
            onTap: () {
              // Handle dark mode toggle logic here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Dark mode setting")),
              );
            },
          ),
          SizedBox(height: 12),

          // Help & Support section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Help & Support",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 12),
          ListTile(
            title: Text("About"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.info_outline_rounded),
            onTap: () {
              // Handle about page navigation here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("About this app")),
              );
            },
          ),
          SizedBox(height: 12),

          // Privacy section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Privacy",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 12),
          ListTile(
            title: Text("Terms of Service"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.electrical_services_rounded),
            onTap: () {
              // Handle terms of service page here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Terms of Service")),
              );
            },
          ),
          ListTile(
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.privacy_tip_rounded),
            onTap: () {
              // Handle privacy policy page here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Privacy Policy")),
              );
            },
          ),
          ListTile(
            title: Text("Security Policy"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.policy),
            onTap: () {
              // Handle security policy page here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Security Policy")),
              );
            },
          ),
        ],
      ),
    );
  }
}
