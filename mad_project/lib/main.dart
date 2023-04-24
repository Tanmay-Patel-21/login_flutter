import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mad_project/services/auth.dart';
import 'package:provider/provider.dart';
import 'wrapper.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyC-rjIMEy8zS7eCyVFzAIAQtqgOySymv1Q",
        appId: "1:848341521051:android:8fed91e7fcbb91cfcb2c3e",
        messagingSenderId: "848341521051",
        projectId: "ash3-d44f3"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _auth = AuthService();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      value: _auth.user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
