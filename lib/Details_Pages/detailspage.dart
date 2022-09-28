// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:police_offence_officer/homepage.dart';
import 'package:intl/intl.dart';

class detailsPage extends StatefulWidget {
  String name, uid, id, vnumb;
  detailsPage({
    Key? key,
    required this.id,
    required this.uid,
    required this.name,
    required this.vnumb,
  });

  @override
  State<detailsPage> createState() =>
      _detailsPageState(id: id, name: name, uid: uid, vnumb: vnumb);
}

class _detailsPageState extends State<detailsPage> {
  String name, uid, id, vnumb;
  _detailsPageState({
    required this.id,
    required this.uid,
    required this.name,
    required this.vnumb,
  });
  final _controller = TextEditingController();
  String type = "";
  String description = "";
  String amount = "";
  String officername = "";
  String station = "";
  static const List<String> list = <String>['type', 'A', 'B', 'C', 'D'];
  String dropdownValue = list.first;
  String output = '';

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid1 = user!.uid;
    CollectionReference databse =
        FirebaseFirestore.instance.collection('Office');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 91, 100),
      appBar: AppBar(
        title: Text("Add Fine"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Color.fromARGB(255, 165, 201, 202),
                            height: 36,
                          )),
                    ),
                    Text(
                      "User Details",
                      style: TextStyle(
                          color: Color.fromARGB(255, 165, 201, 202),
                          fontSize: 20),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Color.fromARGB(255, 165, 201, 202),
                            height: 36,
                          )),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Name: ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 201, 202),
                            fontSize: 20.0)),
                    Text(name,
                        style: TextStyle(color: Colors.white, fontSize: 20.0))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("NIC: ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 201, 202),
                            fontSize: 20.0)),
                    Text(id,
                        style: TextStyle(color: Colors.white, fontSize: 20.0))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Vehicle Number: ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 201, 202),
                            fontSize: 20)),
                    Text(vnumb,
                        style: TextStyle(color: Colors.white, fontSize: 20.0))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Color.fromARGB(255, 165, 201, 202),
                            height: 36,
                          )),
                    ),
                    Text(
                      "Officer Details",
                      style: TextStyle(
                          color: Color.fromARGB(255, 165, 201, 202),
                          fontSize: 20),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Color.fromARGB(255, 165, 201, 202),
                            height: 36,
                          )),
                    )
                  ],
                ),
                SizedBox(height: 10),
                FutureBuilder<DocumentSnapshot>(
                  future: databse.doc(uid1).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      officername = data['username'];
                      station = data['station'];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text("Officer Name: ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 165, 201, 202),
                                      fontSize: 20)),
                              Text(data['username'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0))
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text("Police Station: ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 165, 201, 202),
                                      fontSize: 20)),
                              Text(data['station'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0))
                            ],
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator(
                      color: Colors.white,
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Color.fromARGB(255, 165, 201, 202),
                            height: 36,
                          )),
                    ),
                    Text(
                      "Fine Details",
                      style: TextStyle(
                          color: Color.fromARGB(255, 165, 201, 202),
                          fontSize: 20),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Color.fromARGB(255, 165, 201, 202),
                            height: 36,
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Select Type: ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 201, 202),
                            fontSize: 20.0)),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 44, 51, 51),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 165, 201, 202)),
                      underline: Container(
                        height: 2,
                        color: Color.fromARGB(255, 44, 51, 51),
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          output = value;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Fine Amount: ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 201, 202),
                            fontSize: 20.0)),
                    (output == "A")
                        ? Text("3000.00",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0))
                        : (output == "B")
                            ? Text("4000.00",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0))
                            : (output == "C")
                                ? Text("5000.00",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0))
                                : (output == "D")
                                    ? Text("6000.00",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0))
                                    : Text("0.00",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0))
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.white,
                      ),
                      hintText: 'Description',
                      hintStyle:
                          TextStyle(color: Colors.white, fontSize: 20.0)),
                  onChanged: (val) {
                    setState(() {
                      description = val;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      (output == "A")
                          ? (amount = "3000")
                          : (output == "B")
                              ? (amount = "4000")
                              : (output == "C")
                                  ? (amount = "5000")
                                  : (output == "D")
                                      ? (amount = "6000")
                                      : (amount = "0.00");
                      print(output);
                      print(amount);

                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final User? user = auth.currentUser;
                      final uid1 = user!.uid;
                      DocumentReference docRef = FirebaseFirestore.instance
                          .collection("Office")
                          .doc(uid1)
                          .collection("fine")
                          .doc();

                      docRef.set({
                        'amount': amount,
                        'description': description,
                        'type': output,
                        'date': DateTime.now(),
                        'month': DateTime.now().month,
                        'expired': DateTime.now().add(const Duration(days: 14)),
                        'mode': "notpaid",
                        'vnum': vnumb,
                        'username': name,
                        'nic': id,
                        'paiddate': '',
                      });
                      print(docRef.id);
                      FirebaseFirestore.instance
                          .collection("Data")
                          .doc(uid)
                          .collection("fine")
                          .doc()
                          .set({
                        'officername': officername,
                        'station': station,
                        'amount': amount,
                        'description': description,
                        'type': output,
                        'month': DateTime.now().month,
                        'date': DateTime.now(),
                        'expired': DateTime.now().add(const Duration(days: 14)),

                        // formatDate(DateTime.now()
                        //     .add(Duration(minutes: 4320))
                        //     .toString(),[
                        //           dd,
                        //           mm,
                        //           yyyy,
                        //         ]),
                        'mode': "notpaid",
                        'docid': docRef.id,
                        'oficeuid': uid,
                        'paiddate': '',
                        'status': '',
                        'limit':''
                      });
                      _controller.clear();
                      Fluttertoast.showToast(
                          msg: "System updated",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
