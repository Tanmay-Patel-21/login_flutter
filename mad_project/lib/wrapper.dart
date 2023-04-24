import 'package:flutter/material.dart';
import 'package:mad_project/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'screens/authenticate/sign-in.dart';
import 'screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
