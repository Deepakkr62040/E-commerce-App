import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/login.dart';
import 'package:ecommerce/verifyemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint(snapshot.data.toString());
            if (snapshot.data!.emailVerified) {
              return const Homepage();
            } else {
              return const Verify();
            }
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
