import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _buttonOffset;

  @override
  void initState() {
    super.initState();
    
    // Initialize Animation Controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    // Define the animations
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _buttonOffset = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // Start the animations
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[400]!, Colors.blue[200]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Spacer
            Expanded(child: Container()),

            // Logo Section with Animated Opacity
            AnimatedBuilder(
              animation: _logoOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoOpacity.value,
                  child: child,
                );
              },
              child: Icon(
                Icons.kitchen,
                size: 120,
                color: Colors.white,
              ),
            ),
            
            SizedBox(height: 30),

            // App Name with Animated Opacity
            AnimatedBuilder(
              animation: _textOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _textOpacity.value,
                  child: child,
                );
              },
              child: Text(
                "Smart Pantry Manager",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            
            SizedBox(height: 12),
            
            // Tagline with Animated Opacity
            AnimatedBuilder(
              animation: _textOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _textOpacity.value,
                  child: child,
                );
              },
              child: Text(
                '"Efficient pantry management at your fingertips!"',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Bottom Spacer
            Expanded(child: Container()),

            // Get Started Button with Animated Slide In
            AnimatedBuilder(
              animation: _buttonOffset,
              builder: (context, child) {
                return SlideTransition(
                  position: _buttonOffset,
                  child: child,
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(24),
                  elevation: 8,
                ),
                child: Icon(Icons.arrow_forward, color: Colors.blue, size: 30),
              ),
            ),
            
            SizedBox(height: 12),
            
            // "Get Started" Text
            Text(
              "Get Started",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
