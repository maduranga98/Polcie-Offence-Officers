// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:police_offence_officer/Details_Pages/datachart.dart';
import 'package:police_offence_officer/Details_Pages/dataseries.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  static const List<String> list = <String>[
    'month',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  String dropdownValue = list.first;
  String output = "";
  int A = 0, B = 0, C = 0, D = 0;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    var date = DateTime.now();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 91, 100),
      appBar: AppBar(
        title: Text("Report"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Office')
                .doc(uid)
                .collection('fine')
                .where('month', isEqualTo: date.month)
                .snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var ds = snapshot.data!.docs;

              for (int i = 0; i < ds.length; i++) {
                if (ds[i]['type'] == "A") {
                  A = A + 1;
                } else if (ds[i]['type'] == "B") {
                  B = B + 1;
                } else if (ds[i]['type'] == "C") {
                  C = C + 1;
                } else if (ds[i]['type'] == "D") {
                  D = D + 1;
                }
              }
              int totalA = A * 3000;
              int totalB = B * 4000;
              int totalC = C * 5000;
              int totalD = D * 6000;
              int total = totalA + totalB + totalC + totalD;
              int totalamount = A + B + C + D;
              List<dataseries> data = [
                dataseries(
                    type: "A",
                    value: A,
                    barcolor: charts.ColorUtil.fromDartColor(Colors.black)),
                dataseries(
                    type: "B",
                    value: B,
                    barcolor: charts.ColorUtil.fromDartColor(Colors.amber)),
                dataseries(
                    type: "C",
                    value: C,
                    barcolor: charts.ColorUtil.fromDartColor(Colors.blue)),
                dataseries(
                    type: "D",
                    value: D,
                    barcolor: charts.ColorUtil.fromDartColor(Colors.green)),
              ];
              return Column(
                children: [
                  Text(
                    "Report Month: ${DateTime.now().month}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Table(
                      border: TableBorder.all(color: Colors.white),
                      children: [
                        buildRow(['Type', 'Amount', 'Fine', 'Total'],
                            isHeader: true),
                        buildRow(
                            ['A', A.toString(), '3000', totalA.toString()]),
                        buildRow(
                            ['B', B.toString(), '4000', totalB.toString()]),
                        buildRow(
                            ['C', C.toString(), '5000', totalC.toString()]),
                        buildRow(
                            ['D', D.toString(), '6000', totalD.toString()]),
                        buildRow([
                          'Total',
                          totalamount.toString(),
                          '',
                          total.toString()
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.0),
                  DataCharts(data: data)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
          children: cells.map((e) {
        final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.bold,
            fontSize: 18.0);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Text(
            e,
            style: TextStyle(color: Color.fromARGB(255, 165, 201, 202)),
          )),
        );
      }).toList());
}
