import 'package:ecommerce/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    sendVerifyLink();
    super.initState();
  }

  Future<void> sendVerifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then(
      (value) => {
        Get.snackbar(
          'link sent',
          'A link has been send to your email',
          margin: EdgeInsets.all(30),
          snackPosition: SnackPosition.BOTTOM,
        ),
      },
    );
  }

  Future<void> reload() async {
    await FirebaseAuth.instance.currentUser!.reload().then(
      (value) => {Get.offAll(Wrapper())},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Email Varification")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Check your email and verify your account",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: reload, child: const Text("I verified")),
          ],
        ),
      ),
    );
  }
}
