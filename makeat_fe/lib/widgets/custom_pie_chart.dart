import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatefulWidget {
  final Map<String, double> dataMap;
  final bool isLegends;

  const CustomPieChart({
    Key? key, 
    required this.dataMap,
    this.isLegends = true,
  }) : super(key: key);

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: widget.dataMap,
      animationDuration: const Duration(milliseconds: 700),
      // colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      // centerText: "단위: [%]",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: widget.isLegends,
        legendTextStyle: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
        chartValueStyle: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          color: Colors.black
        )
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}