import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class passwordreset extends StatefulWidget {
  const passwordreset({super.key});

  @override
  State<passwordreset> createState() => _passwordresetState();
}

class _passwordresetState extends State<passwordreset> {
  final resetemailctrl = TextEditingController();

  void resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: resetemailctrl.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(" reset password Email has been send")),
      );
      resetemailctrl.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.code)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: resetemailctrl,
            decoration: InputDecoration(
              hintText: "your Email for password reset",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              resetpassword();
            },
            child: Text("Send Password reset email"),
          ),
        ],
      ),
    );
  }
}
