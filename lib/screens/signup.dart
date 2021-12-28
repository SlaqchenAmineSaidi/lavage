// ignore_for_file: avoid_print, prefer_final_fields, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<Signup> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signing up'),
          backgroundColor: Colors.grey[900],
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/login.jpg'), fit: BoxFit.cover)),
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
                      Text(
                        'Sign up',
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
                          controller: _nameController,
                          validator: (value) => value.isEmpty
                              ? 'please enter the first name'
                              : null,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(
                              Icons.account_circle,
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
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed: () {
                            Map creds = {
                              'name': _nameController.text,
                              'email': _emailController.text,
                              'password': _passwordController.text,
                              'device_name': 'mobile',
                            };
                            if (_formKey.currentState.validate()) {
                              Provider.of<Auth>(context, listen: false)
                                  .store(creds: creds);
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
