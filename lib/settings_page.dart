import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = true;
  String _username = 'Bhavya sree';
  String _email = 'sreebhavya295@gmail.com';

  // Method to toggle notifications setting
  void _toggleNotification(bool value) {
    setState(() {
      _isNotificationEnabled = value;
    });
  }

  // Method to show Help and Contact information
  void _showHelpAndContact() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help & Contact'),
          content: const Text(
            'For any issues or support, you can contact us.\n\n'
            'Team Details:\n\n'
            'P N Bhavya Sree\n'
            '1RV23IS083\n'
            'pnagabhavya.is23@rvce.edu.in\n\n'
            'Rajata M Hegde\n'
            '1RV23IS098\n'
            'rajatamhegde.is23@rvce.edu.in\n\n'
            'Sahana\n'
            '1RV23IS407\n'
            'sahana.is24@rvce.edu.in\n\n'
            'N Srinidhi Krouncha\n'
            '1RV23IS078\n'
            'nivarthisk.is23@rvce.edu.in\n\n'
            'Thank you for using our app!',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Method to show Family Code
  void _showFamilyCode() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Family Code'),
          content: const Text('Your Family Code is: ABC123'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // User Details Section
            const Text(
              'User Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text('Username: $_username'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _editUsername,
              ),
            ),
            ListTile(
              title: Text('Email: $_email'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _editEmail,
              ),
            ),
            const Divider(),

            // Preferences Section
            const Text(
              'Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _isNotificationEnabled,
              onChanged: _toggleNotification,
            ),
            const Divider(),

            // Reset Password Section
            ListTile(
              title: const Text('Reset Password'),
              trailing: const Icon(Icons.lock_reset),
              onTap: _resetPassword,
            ),
            const Divider(),

            // Help and Contact Section
            ListTile(
              title: const Text('Help & Contact'),
              trailing: const Icon(Icons.help),
              onTap: _showHelpAndContact,
            ),
            const Divider(),

            // Get Family Code Section
            ListTile(
              title: const Text('Get Family Code'),
              trailing: const Icon(Icons.code),
              onTap: _showFamilyCode,
            ),
            const Divider(),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Edit username dialog
  void _editUsername() {
    TextEditingController controller = TextEditingController(text: _username);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Username'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _username = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Edit email dialog
  void _editEmail() {
    TextEditingController controller = TextEditingController(text: _email);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Email'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter new email'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _email = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Reset Password function
  void _resetPassword() {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Current Password'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'New Password'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Confirm New Password'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newPasswordController.text ==
                    confirmPasswordController.text) {
                  // Handle password reset logic here
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password updated successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match!')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Logout function
  void _logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform logout logic here
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
