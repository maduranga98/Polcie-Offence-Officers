// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:police_offence_officer/Details_Pages/dataseries.dart';

class DataCharts extends StatelessWidget {
  final List<dataseries> data;

  DataCharts({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<dataseries, String>> series = [
      charts.Series(
        id: "Types",
        data: data,
        domainFn: (dataseries series, _) => series.type,
        measureFn: (dataseries series, _) => series.value,
        colorFn: (dataseries series, _) => series.barcolor,
      )
    ];
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Graphical Representation:",
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
