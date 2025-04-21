import 'package:flutter/material.dart';
import 'package:smartpantry/login_signup_screen.dart';
import 'package:smartpantry/dashboard_screen.dart';
import 'package:smartpantry/family_page.dart';
import 'package:smartpantry/settings_page.dart';
import 'package:smartpantry/shopping_page.dart';
import 'package:smartpantry/suggestion.dart';
import 'package:smartpantry/view_pantry.dart';
import 'package:smartpantry/welcome_screen.dart';
import 'package:smartpantry/predict_expiry.dart';
import 'package:smartpantry/invite.dart';
//import 'package:smartpantry/pantry_management.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Pantry Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/welcome', // Start at the welcome screen
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginSignupPage(),
        '/dashboard': (context) => HomePage(),
        '/family': (context) => FamilyPage(),
        '/settings': (context) => SettingsPage(),
        '/shopping': (context) => ShoppingListPage(),
        '/suggestion': (context) => RecipeSearchPage(),
        '/viewPantry': (context) => ViewPantryPage(),
        '/predict_expiry': (context) => ShelfLifeHomePage(),
       // '/invite': (context)=> AdminSelectionPage(),
        //'/add': (context) => PantryManagementScreen(),
      },
      // Optional: Error route when a route doesn't exist
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        );
      },
    );
  }
}
