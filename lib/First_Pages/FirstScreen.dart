// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:police_offence_officer/homepage.dart';
import 'package:police_offence_officer/First_Pages/loginpage.dart';

import 'package:shimmer/shimmer.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 57, 91, 100),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SizedBox(
                child: Shimmer.fromColors(
                    // ignore: prefer_const_constructors, sort_child_properties_last
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'PoliceOffence',
                          style: const TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Officers',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    baseColor: Color.fromARGB(255, 165, 201, 202),
                    highlightColor: Color.fromARGB(255, 230, 8, 242)),
              )),
              const SizedBox(
                height: 150.0,
              ),
            ],
          ),
        ));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return Loginpage();
          }
        },
      ),
    );
  }
}
