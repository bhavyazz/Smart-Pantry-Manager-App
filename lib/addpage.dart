import 'package:flutter/material.dart';
import 'add_to_pantry.dart'; // Import PantryManagementScreen
import 'predict_expiry.dart'; // Import ShelfLifeHomePage

class Addpage extends StatelessWidget {
  const Addpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantry Management',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[800]!, Colors.blue[400]!],
              ),
            ),
          ),

          // Decorative Floating Icons
          Positioned(
            top: 50,
            left: 30,
            child: Icon(Icons.fastfood, size: 80, color: Colors.white.withOpacity(0.2)),
          ),
          Positioned(
            bottom: 120,
            right: 40,
            child: Icon(Icons.local_pizza, size: 100, color: Colors.white.withOpacity(0.2)),
          ),
          Positioned(
            bottom: 200,
            left: 20,
            child: Icon(Icons.emoji_food_beverage, size: 90, color: Colors.white.withOpacity(0.2)),
          ),
          Positioned(
            top: 200,
            right: 30,
            child: Icon(Icons.cake, size: 80, color: Colors.white.withOpacity(0.2)),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Add to Pantry Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PantryManagementScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 15,
                      backgroundColor: const Color.fromARGB(255, 82, 166, 235), // Updated button color
                    ),
                    child: const Text(
                      'Add to Pantry',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Space between buttons

                // Predict Expiry Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShelfLifeHomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 15,
                      backgroundColor: Colors.blue[600], // Updated button color
                    ),
                    child: const Text(
                      'Predict Expiry',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
