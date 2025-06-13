import 'package:class11/SignIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Variables for the TextFields:
  final db = FirebaseFirestore.instance;
  final fnamectrl = TextEditingController();
  final lnamectrl = TextEditingController();
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  final cpasswordctrl = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Text("Get Started",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text("Create your account in seconds",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Form Fields
              _buildInputField(fnamectrl, "First Name", Icons.person_outline),
              const SizedBox(height: 16),
              _buildInputField(lnamectrl, "Last Name", Icons.person_outline),
              const SizedBox(height: 16),
              _buildInputField(emailctrl, "Email Address", Icons.email_outlined),
              const SizedBox(height: 16),
              _buildPasswordField(passwordctrl, "Create Password", true),
              const SizedBox(height: 16),
              _buildPasswordField(cpasswordctrl, "Confirm Password", false),
              const SizedBox(height: 24),

              // Signup Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () async {
                    if (fnamectrl.text.isEmpty ||
                        lnamectrl.text.isEmpty ||
                        emailctrl.text.isEmpty ||
                        passwordctrl.text.isEmpty ||
                        cpasswordctrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("All fields are required")),
                      );
                    } else if (passwordctrl.text != cpasswordctrl.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords don't match")),
                      );
                    } else {
                      await db.collection('user').add({
                        "First Name": fnamectrl.text,
                        "Last Name": lnamectrl.text,
                        "Email": emailctrl.text,
                        "Password": passwordctrl.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Signup successful!")),
                      );
                      fnamectrl.clear();
                      lnamectrl.clear();
                      emailctrl.clear();
                      passwordctrl.clear();
                      cpasswordctrl.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: const Text("SIGN UP",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // Sign in link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      children: [
                        const TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hint, bool isPassword) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _obscurePassword : _obscureConfirmPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        hintText: hint,
        prefixIcon: Icon(
          isPassword ? Icons.lock_outline : Icons.verified_user,
          color: Colors.grey.shade500,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPassword
                ? (_obscurePassword ? Icons.visibility_off : Icons.visibility)
                : (_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
            color: Colors.grey.shade500,
          ),
          onPressed: () {
            setState(() {
              if (isPassword) {
                _obscurePassword = !_obscurePassword;
              } else {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              }
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }
}