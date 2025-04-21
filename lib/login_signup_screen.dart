import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isLogin = true;

  // Static mock database for user credentials
  static final Map<String, String> users = {}; // Email -> Password

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? errorMessage;

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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Smart Pantry Manager',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isLogin
                        ? 'Welcome Back! Log in to continue'
                        : 'Create an account to get started',
                    style: const TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),

                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error, color: Colors.red),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                errorMessage!,
                                style: const TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),
                  isLogin ? _buildLoginForm() : _buildSignupForm(),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                        errorMessage = null; // Clear error message when toggling
                      });
                    },
                    child: Text(
                      isLogin
                          ? "Don't have an account? Sign Up"
                          : "Already have an account? Log In",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Icon(Icons.lock_open, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          _buildTextField(_emailController, Icons.email, 'Email'),
          const SizedBox(height: 10),
          _buildTextField(_passwordController, Icons.lock, 'Password', isPassword: true),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(13, 71, 161, 1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Icon(Icons.person_add, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          _buildTextField(_nameController, Icons.person, 'Name'),
          const SizedBox(height: 10),
          _buildTextField(_emailController, Icons.email, 'Email'),
          const SizedBox(height: 10),
          _buildTextField(_passwordController, Icons.lock, 'Password', isPassword: true),
          const SizedBox(height: 10),
          _buildTextField(_confirmPasswordController, Icons.lock, 'Confirm Password',
              isPassword: true),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _handleSignup,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(13, 71, 161, 1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String hint,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blue[900]),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color.fromRGBO(13, 71, 161, 1), width: 1.5),
        ),
      ),
    );
  }

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Both email and password are required to log in.';
      });
      return;
    }

    if (!users.containsKey(email) || users[email] != password) {
      setState(() {
        errorMessage = 'Invalid email or password.';
      });
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _handleSignup() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        errorMessage = 'All fields are required to sign up.';
      });
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      setState(() {
        errorMessage = 'Invalid email format.';
      });
      return;
    }

    if (password.length < 8) {
      setState(() {
        errorMessage = 'Password must be at least 8 characters long.';
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        errorMessage = 'Passwords do not match.';
      });
      return;
    }

    if (users.containsKey(email)) {
      setState(() {
        errorMessage = 'Email is already registered.';
      });
      return;
    }

    users[email] = password;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
