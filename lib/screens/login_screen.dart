// ignore_for_file: avoid_print, prefer_final_fields, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/signup.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.grey[900],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/login.jpg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 120.0),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  border: Border.all(
                                      color: Colors.blue, // Set border color
                                      width: 3.0), // Set border width
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          10.0)), // Set rounded corner radius
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                        offset: Offset(1, 3))
                                  ] // Make rounded corner of border
                                  ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (String value) {
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                return 'Email is required';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Invalid email';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                fontSize: 15,

                                //backgroundColor: Colors.transparent,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) =>
                                value.isEmpty ? 'please enter password' : null,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                              ),
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                fontSize: 15,
                                //backgroundColor: Colors.transparent,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: MaterialButton(
                            onPressed: () {
                              Map creds = {
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'device_name': 'mobile',
                              };
                              if (_formKey.currentState.validate()) {
                                Provider.of<Auth>(context, listen: false)
                                    .login(creds: creds);
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            TextButton(
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                    color: Colors.cyanAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
