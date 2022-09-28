// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police_offence_officer/Details_Pages/detailspage.dart';
import 'package:police_offence_officer/Drawer_Pages/it_support.dart';
import 'package:police_offence_officer/First_Pages/loginpage.dart';
import 'package:police_offence_officer/Drawer_Pages/notpaid.dart';
import 'package:police_offence_officer/Drawer_Pages/paid.dart';
import 'package:police_offence_officer/Drawer_Pages/profile.dart';
import 'package:police_offence_officer/Drawer_Pages/report.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? vnumb = "";
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid1 = user!.email;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 91, 100),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Card(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Vehicle number'),
            onChanged: (val) {
              setState(() {
                vnumb = val;
              });
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 44, 51, 512),
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        " Police",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                      Text(
                        "Offence",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 231, 264, 242)),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "$uid1",
                      style: TextStyle(
                          color: Color.fromARGB(255, 165, 201, 202),
                          fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Color.fromARGB(255, 165, 201, 202),
              ),
              title: const Text('Profile',
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 201, 202),
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userProfile()));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Color.fromARGB(255, 165, 201, 202),
              ),
              title: const Text('Report',
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 201, 202),
                  )),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Report()));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.paid,
                color: Color.fromARGB(255, 165, 201, 202),
              ),
              title: const Text('Paid',
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 201, 202),
                  )),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => paid()));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.paid_outlined,
                color: Color.fromARGB(255, 165, 201, 202),
              ),
              title: const Text('Not-Paid',
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 201, 202),
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notpaid()));
              },
            ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.support_agent,
            //     color: Color.fromARGB(255, 165, 201, 202),
            //   ),
            //   title: const Text('IT Support',
            //       style: TextStyle(
            //         color: Color.fromARGB(255, 165, 201, 202),
            //       )),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => It_Support()));
            //   },
            // ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Color.fromARGB(255, 165, 201, 202),
              ),
              title: const Text('signout',
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 201, 202),
                  )),
              onTap: () {
                // FirebaseAuth.instance.signOut();
                final FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
                if (user == null) {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                  Get.to(Loginpage());
                }
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: (vnumb != " " && vnumb != null)
              ? FirebaseFirestore.instance
                  .collection('Data')
                  .where('vnum', isEqualTo: vnumb)
                  .snapshots()
              : FirebaseFirestore.instance.collection('Data').snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Column(children: [
                          ListTile(
                            tileColor: Color.fromARGB(255, 44, 51, 51),
                            title: Text(
                              'Name: ${data['username']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text('Vehicle Number: ${data['vnum']}',
                                style: TextStyle(color: Colors.white)),
                            trailing: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => detailsPage(
                                          id: data['id'],
                                          uid: data['uid'],
                                          name: data['username'],
                                          vnumb: data['vnum'])));
                              _controller.clear();
                            },
                          )
                        ]),
                      );
                    }),
                  );
          }),
    );
  }
}
