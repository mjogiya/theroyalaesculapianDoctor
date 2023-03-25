import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/Connection/auth.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  String name = '';
  String email = '';
  String mobile = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              title: Text('Register as Patient'),
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
                      image: AssetImage('Logos/patient1.png'),
                      height: 200,
                      width: 200,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter Your name' : null,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
//full name text box

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
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                                color: Colors.white, letterSpacing: 3.0)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter Your email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
 //email text box
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
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                                color: Colors.white, letterSpacing: 3.0)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter Your Mobile Number' : null,
                        onChanged: (val) {
                          setState(() {
                            mobile = val;
                          });
                        },
//mobile text box
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
                            labelText: 'Mobile',
                            labelStyle: TextStyle(
                                color: Colors.white, letterSpacing: 3.0)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter Your Password' : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
//password text box
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
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: Color.fromARGB(255, 34, 93, 42),
                          ),
                          child: const Text('Register'),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              dynamic result = await _auth.registerWithEmail(name, email, mobile, password);
                              if(result == null) {
                                print("something wrong");
                              } else {
                                print(result);
                              }
                            }
                          },
                        )),
                  ],
                ),),
              ),
            )));
  }
}
