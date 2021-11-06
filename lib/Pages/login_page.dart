import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/Providers/login_provider.dart';

TextStyle myStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const routename = '/login_page';

  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      onChanged: (val) {
        setState(() {
          username = val;
        });
      },
      style: myStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    // ignore: non_constant_identifier_names
    final PasswordField = TextField(
      onChanged: (val) {
        setState(() {
          password = val;
        });
      },
      obscureText: true,
      style: myStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Consumer(builder: (context, ref, _) {
          final _auth = ref.watch(authenticationProvider);

          return Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.supervised_user_circle,
                        size: 100,
                      ),
                      const SizedBox(
                        height: 180,
                      ),
                      usernameField,
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordField,
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.blue,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            onPressed: () async {
                              await _auth
                                  .signInWithEmailAndPassword(
                                      email: username, password: password)
                                  .whenComplete(() => _auth.authStateChange
                                          .listen((event) async {
                                        if (event == null) {
                                          return;
                                        }
                                      }));
                              Beamer.of(context).beamToNamed('/home');
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                          onPressed: () => {}, child: const Text("Sign Up"))
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
