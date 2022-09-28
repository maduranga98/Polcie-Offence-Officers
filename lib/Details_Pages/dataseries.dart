import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class dataseries {
  final String type;
  final int value;
  final charts.Color barcolor;
  dataseries({required this.type, required this.value, required this.barcolor});
}
