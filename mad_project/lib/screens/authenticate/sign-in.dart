import 'package:flutter/material.dart';
import '../../services/auth.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 172, 255, 144),
//         title: const Text("Sign-in"),
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text("Sign in"),
//           onPressed: () async {
//             dynamic user = await _auth.signInAnon();
//             // if (user == null) {
//             // print("Error signing in");
//             // } else {
//             // print("User Signed in \n $user");
//             // }
//           },
//         ),
//       ),
//     );
//   }
// }

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // image: DecorationImage(
        //     image: AssetImage('assets/login.png'), fit: BoxFit.cover),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 21, 21, 21),
            Color.fromARGB(255, 52, 52, 52)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) => val?.isEmpty == true
                                    ? "Enter email ID"
                                    : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                style: const TextStyle(),
                                obscureText: true,
                                validator: (val) =>
                                    val != null && val.length < 6
                                        ? "Password too short"
                                        : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: const Color(0xff4c505b),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            dynamic result =
                                                await _auth.logInWithPassword(
                                                    email, password);
                                            if (result != null) {
                                              print("LOGGED IN");
                                            }
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
