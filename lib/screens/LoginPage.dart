import 'package:Signup_Signin_UI/screens/CreateProfile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'RegisterPage.dart';
import 'CreateProfile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  girisYap() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((user) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => CreateProfile()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/shape.png',
                        width: 170,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 60,
                    ),
                    child: Align(
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 225,
                      ),
                      child: Container(
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: t1,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Email';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 225,
                            ),
                            child: Container(
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: t2,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Password';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.blue,
                            disabledColor: Colors.white,
                            splashColor: Colors.blueAccent,
                            onPressed: () {
                              girisYap();
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot you password?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'OR sign in with',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            child: FlatButton(
                              color: Colors.white,
                              disabledColor: Colors.white,
                              splashColor: Colors.white,
                              onPressed: () {},
                              child: Image.asset('assets/google.png'),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: FlatButton(
                              color: Colors.white,
                              disabledColor: Colors.white,
                              splashColor: Colors.white,
                              onPressed: () {},
                              child: Image.asset('assets/facebook.png'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't you have a account?",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
