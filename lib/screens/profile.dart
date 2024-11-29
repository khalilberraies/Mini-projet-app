import 'package:flutter/material.dart';

class profileuser extends StatefulWidget {
  const profileuser({super.key});

  @override
  State<profileuser> createState() => _profileuserState();
}

class _profileuserState extends State<profileuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile icon and username
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Profile image inside CircleAvatar
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/login.png'), // Replace with your profile image
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Mohamed Khalil Berraies', // Username
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'berrieskhalil@gmail.com', // Email
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile options
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ProfileOption(
                    icon: Icons.settings,
                    title: 'Account Settings',
                    onTap: () {
                      // Handle account settings action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      // Handle change password action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.language,
                    title: 'Language Preferences',
                    onTap: () {
                      // Handle language preferences action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () {
                      // Handle log out action
                      Navigator.pop(context); // Example: Navigate back to login
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue[700],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
