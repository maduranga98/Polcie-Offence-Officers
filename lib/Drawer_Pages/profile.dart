// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid1 = user!.uid;
    CollectionReference database =
        FirebaseFirestore.instance.collection('Office');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 91, 100),
      appBar: AppBar(
        title: Text("User Profile"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: database.doc(uid1).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 120.0,
                      child: ClipRRect(
                        child: Image.asset('assets/officer.png'),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Officer Name: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 201, 202),
                                fontSize: 20)),
                        Text(data['username'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Police Station: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 201, 202),
                                fontSize: 20)),
                        Text(data['station'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Registration Number: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 201, 202),
                                fontSize: 20)),
                        Text(data['rnum'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Phone Number: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 201, 202),
                                fontSize: 20)),
                        Text(data['phone'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("NIC: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 201, 202),
                                fontSize: 20)),
                        Text(data['id'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
