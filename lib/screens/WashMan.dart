import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/services/Wash.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';

class WashMan extends StatefulWidget {
  const WashMan({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WashMan();
}

class _WashMan extends State<WashMan> {
  TextEditingController _Washingnamecontroller = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<String> _errors = [' '];

  @override
  void initState() {
    _Washingnamecontroller.text = 'bogsni';
    _phoneController.text = '0611771354';

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/logina.jpg'), fit: BoxFit.cover)),
        ),
        Scaffold(
          appBar: AppBar(
            title:
                Text('Wash Man Account', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.black87,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 80,
                    child: Center(
                        child: Text(
                      'Wash Man Account',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: _Washingnamecontroller,
                            //validation
                            validator: (String value) {
                              // String pattern = r'(^[a-zA-Z ]*$)';
                              String pattern = r'(^([\s]*[\S]+).{0,249}$)';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                _errors.add("Wash name is required");
                                return ' ';
                              } else if (!regExp.hasMatch(value)) {
                                _errors.add("Wash name is required");
                                return ' ';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                height: 0,
                                fontSize: 15,

                                //backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: InputBorder.none,
                              labelText: "Wash Name",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextFormField(
                                controller: _phoneController,
                                //validation
                                validator: (String value) {
                                  // String pattern = r'(^[a-zA-Z ]*$)';
                                  String pattern = r'(^[0-9]{10}$)';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value.isEmpty) {
                                    _errors.add("phone number is requied");
                                    return ' ';
                                  } else if (!regExp.hasMatch(value)) {
                                    _errors.add("Enter a correct phone number");
                                    return ' ';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  border: InputBorder.none,
                                  labelText: "Phone Number",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Map creds2 = {
                                    'wash_name': _Washingnamecontroller.text,
                                    'phone_number': _phoneController.text,
                                  };
                                  if (_formKey.currentState.validate()) {
                                    Provider.of<Wash>(context, listen: false)
                                        .washing(creds2: creds2);
                                    Provider.of<Auth>(context, listen: false)
                                        .update();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                    print(creds2);
                                  } else {
                                    print(_errors);
                                    print(_errors.join("\n"));
                                    String err = _errors.join("\n");
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.7),
                                              title: Text(
                                                'Error',
                                                style: TextStyle(
                                                    color: Colors.red),
                                                textAlign: TextAlign.center,
                                              ),
                                              content: Text(
                                                err,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              actions: <Widget>[
                                                RaisedButton(
                                                    color: Colors.white
                                                        .withOpacity(0.4),
                                                    child: Text(
                                                      'OK',
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    })
                                              ]);
                                        });
                                  }

                                  setState(() {
                                    print(_errors);
                                    _errors.clear();
                                  });
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 50.0),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    "Apply",
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
