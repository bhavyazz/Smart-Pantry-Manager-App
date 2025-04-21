import 'package:flutter/material.dart';
import 'package:smartpantry/addpage.dart';
import 'package:smartpantry/invite.dart';
import 'view_pantry.dart'; // Import your ViewPantryPage here.
import 'family_page.dart'; // Import the FamilyPage here.
import 'shopping_page.dart'; // Import the ShoppingPage here.
import 'settings_page.dart'; // Import the SettingsPage here.
import 'suggestion.dart';
import 'notification_page.dart'; // Import NotificationPage here.
import 'invite.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          title: const Text(
            'Smart Pantry Manager',
            style: TextStyle(
              fontFamily: 'Roboto',  // Use a modern font
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                // Navigate to NotificationPage when bell icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.sync, color: Colors.black),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4FC3F7), Color(0xFF0288D1)],  // More refined blue gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF81D4FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: _menuItems.length,
            itemBuilder: (context, index) {
              final item = _menuItems[index];
              return _buildGridItem(
                icon: item['icon'] as IconData,
                label: item['label'] as String,
                color: item['color'] as Color,
                context: context, // Pass context to navigate
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String label,
    required Color color,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        if (label == 'View Pantry') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewPantryPage()),
          );
        } else if (label == 'Family') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AdminSelectionPage()),
          );
        } else if (label == 'Shopping List') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShoppingListPage()),
          );
        } else if (label == 'Settings') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        } else if (label == 'Recipes') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecipeSearchPage()),
          );
        } else if (label == 'Add Items') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addpage()),
          );
        }
      },
      splashColor: color.withOpacity(0.3),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Icon(icon, size: 48, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> _menuItems = [
  {
    'icon': Icons.kitchen,
    'label': 'View Pantry',
    'color': Color(0xFF66BB6A),
  },
  {
    'icon': Icons.add_circle_outline,
    'label': 'Add Items',
    'color': Color(0xFFFFCA28),
  },
  {
    'icon': Icons.group,
    'label': 'Family',
    'color': Color(0xFF42A5F5),
  },
  {
    'icon': Icons.restaurant_menu,
    'label': 'Recipes',
    'color': Color(0xFFEF5350),
  },
  {
    'icon': Icons.shopping_cart,
    'label': 'Shopping List',
    'color': Color(0xFF8D6E63),
  },
  {
    'icon': Icons.settings,
    'label': 'Settings',
    'color': Color(0xFFAB47BC),
  },
];
