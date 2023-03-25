import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/Account/Editprofile.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          backgroundColor: Color.fromARGB(255, 3, 55, 57),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              SizedBox(height: 40),
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage('Logos/doctor.png'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Mayur Jogiya (Doctor)'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Editprofile();
                    },
                  ));
                },
                child: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 3, 55, 30),
                    shape: StadiumBorder()),
              ),
              const Divider(),
              SizedBox(height: 20),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: Icon(
                    Icons.access_alarm,
                    color: Colors.black,
                  ),
                ),
                title: Text('Reminders'),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: Icon(
                    Icons.delivery_dining,
                    color: Colors.black,
                  ),
                ),
                title: Text('Orders'),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.black,
                  ),
                ),
                title: Text('Medical Records'),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: Icon(
                    Icons.wallet,
                    color: Colors.black,
                  ),
                ),
                title: Text('Wallet'),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: Icon(
                    Icons.logout,
                  ),
                ),
                title: Text('Log Out'),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
