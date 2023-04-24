import 'package:flutter/material.dart';
import 'package:mad_project/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _auth.signOut();
            print("clicked");
          },
          child: const Text("Log Out"),
        ),
      ),
    );
  }
}
