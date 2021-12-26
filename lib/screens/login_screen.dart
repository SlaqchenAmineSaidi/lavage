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
    _emailController.text = 'amine@gmail.com';
    _passwordController.text = 'password';
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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'images/login.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Signing in'),
          ),
          body: Padding(
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
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyanAccent,
                        ),
                      ),
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
                          validator: (value) =>
                              value.isEmpty ? 'please enter valid email' : null,
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
                              color: Colors.white,
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
                              color: Colors.white,
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
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Register Now',
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
        ),
      ],
    );
  }
}
