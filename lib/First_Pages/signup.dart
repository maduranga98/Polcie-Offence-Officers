// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, unrelated_type_equality_checks, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:police_offence_officer/homepage.dart';
import 'package:police_offence_officer/First_Pages/loginpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<FormState> formKey = GlobalKey();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final regumb = TextEditingController();
  final nic = TextEditingController();
  final station = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 91, 100),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 200.0),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
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
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Full name',
                        hintText: 'Full name',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.person_sharp,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: name,
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          value!.isEmpty ? 'Name cannot be blank' : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'NIC',
                        hintText: 'NIC',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.integration_instructions_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: nic,
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value!.isEmpty ? 'NIC cannot be blank' : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Registration number',
                        hintText: 'Registration number',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.admin_panel_settings_sharp,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: regumb,
                      keyboardType: TextInputType.text,
                      validator: (value) => value!.isEmpty
                          ? 'Registration number cannot be blank'
                          : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),

                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Police Station',
                        hintText: 'Police Station',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.account_balance_sharp,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: station,
                      keyboardType: TextInputType.text,
                      validator: (value) => value!.isEmpty
                          ? 'Police Station cannot be blank'
                          : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Phone number',
                        hintText: 'Phone number',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: phone,
                      keyboardType: TextInputType.text,
                      validator: (value) => value!.isEmpty
                          ? 'Registration number cannot be blank'
                          : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      // key: TextInputType.emailAddress,
                      cursorColor: Colors.grey,
                      // validator: (email)=>email != null &&!Email,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Email',
                        hintText: 'E-mail',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? 'Email cannot be blank' : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Password',
                        hintText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.key_sharp,
                          color: Colors.grey,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value!.isEmpty ? 'Password cannot be blank' : null,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            MaterialButton(
              onPressed: () async {
                try {
                  if (formKey.currentState!.validate()) {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim(),
                    );
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User? user = auth.currentUser;
                    if (user != Null) {
                      final uid = user!.uid;
                      FirebaseFirestore.instance
                          .collection("Office")
                          .doc(uid)
                          .set({
                        'username': name.text.trim(),
                        'id': nic.text.trim(),
                        'rnum': regumb.text.trim(),
                        'station': station.text.trim(),
                        'phone': phone.text.trim(),
                        'email': email.text.trim(),
                        'password': password.text.trim(),
                        'uid': uid,
                      });
                      // Get.to(HomePage());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                      navigatorKey.currentState?.pushNamedAndRemoveUntil(
                          'HomwPage', (route) => false);
                      Fluttertoast.showToast(
                          msg: "Welcome to PoliceOffence",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Something went wrong!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                } catch (e) {
                  print(e);
                }
              },
              height: 45,
              color: Colors.black,
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 165, 201, 202),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage())),
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                        color: Color.fromARGB(255, 231, 264, 242),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
