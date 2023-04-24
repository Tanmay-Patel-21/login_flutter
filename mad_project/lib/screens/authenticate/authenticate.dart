import 'package:flutter/material.dart';
import 'sign-in.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: SignIn());
  }
}
