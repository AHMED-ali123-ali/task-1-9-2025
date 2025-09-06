import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
              ),
              height: 300,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 20, top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter your beautiful world',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 70),

            // Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Example: Ahmedali123@gmail.com',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                  labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Example: 220220420@@',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Password',
                  labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),

            // Forget Password
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget password?',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'You don’t have an Account?',
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}