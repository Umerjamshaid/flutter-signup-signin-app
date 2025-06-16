import 'package:class11/Dashboard.dart';
import 'package:class11/SignUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  final db = FirebaseFirestore.instance;
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              child: TextField(
                controller: emailctrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: "Enter Your Email",
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextField(
                controller: passwordctrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: "Enter Your Password",
                  prefixIcon: Icon(Icons.password_rounded),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text("Create New Account?"),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (emailctrl.text == "" || passwordctrl == "") {
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("All Fields Are Require")),
                    );
                  }
                } else {
                  QuerySnapshot userSnapshot =
                      await db
                          .collection('user')
                          .where("Email", isEqualTo: emailctrl.text)
                          .where("Password", isEqualTo: passwordctrl.text)
                          .get();
                  if (userSnapshot.docs.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("SignIn Successfully")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid Email OR Password.")),
                    );
                  }
                  emailctrl.clear();
                  passwordctrl.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text("SignIn"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final GoogleSignIn _googleSignIn = GoogleSignIn();

                try {
                  final GoogleSignInAccount? googleUser =
                      await _googleSignIn.signIn();

                  if (googleUser != null) {
                    final GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;

                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );

                    await FirebaseAuth.instance.signInWithCredential(
                      credential,
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  print('FirebaseAuthException: ${e.code}');
                } catch (e) {
                  print('Error: $e');
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: Size(5, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text("G"),
            ),
          ],
        ),
      ),
    );
  }
}
