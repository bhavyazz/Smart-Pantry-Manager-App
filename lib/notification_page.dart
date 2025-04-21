import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final Color primaryBlue = const Color(0xFF1976D2);

  // Sample expiry notifications
  final List<Map<String, dynamic>> _expiringItems = [
    {
      'itemName': 'Milk',
      'expiryDate': DateTime.now().add(const Duration(days: 2)),
    },
    {
      'itemName': 'Yogurt',
      'expiryDate': DateTime.now().add(const Duration(days: 1)),
    },
    {
      'itemName': 'Eggs',
      'expiryDate': DateTime.now().add(const Duration(hours: 20)),
    },
  ];

  Widget _buildExpiryNotification(Map<String, dynamic> notification) {
    final bool isUrgent = notification['expiryDate'].difference(DateTime.now()).inDays < 2;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isUrgent ? Colors.red[100] : Colors.orange[100],
          child: Icon(
            Icons.warning_rounded,
            color: isUrgent ? Colors.red : Colors.orange,
          ),
        ),
        title: Text(
          notification['itemName'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Expires on ${DateFormat('MMM dd, yyyy').format(notification['expiryDate'])}',
          style: TextStyle(
            color: isUrgent ? Colors.red : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Expiry Notifications'),
      ),
      body: ListView.builder(
        itemCount: _expiringItems.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          return _buildExpiryNotification(_expiringItems[index]);
        },
      ),
    );
  }
}
