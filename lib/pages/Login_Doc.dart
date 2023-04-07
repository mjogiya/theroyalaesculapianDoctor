import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/Connection/auth.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/DocDashboard.dart';

class Login_Doctor extends StatefulWidget {
  const Login_Doctor({Key? key}) : super(key: key);

  @override
  State<Login_Doctor> createState() => _Login_DoctorState();
}

class _Login_DoctorState extends State<Login_Doctor> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 3, 55, 57),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 3, 55, 30),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text('Login as Doctor'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('Logos/doctor.png'),
                        height: 200,
                        width: 200,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          validator: (val) =>
                          val!.isEmpty ? 'Enter Your email' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors.white, letterSpacing: 3.0)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          validator: (val) =>
                          val!.isEmpty ? 'Enter Your Password' : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white, letterSpacing: 3.0)),
                        ),
                      ),
                      Container(
                          height: 90,
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              backgroundColor: Color.fromARGB(255, 34, 93, 42),
                            ),
                            child: const Text('LOG IN'),
                            onPressed: () async {
                              print(email);
                              print(password);
                              if (_formKey.currentState!.validate()) {
                                dynamic result =
                                await _auth.SigninWithEmail(email, password);
                                if (result == null) {
                                  print("something wrong");
                                } else {
                                  Navigator.of(context)
                                      .pushReplacement(new MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return DocDashboard();
                                    },
                                  ));
                                }
                              }
                            },
                          )),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
