import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_legend.dart';


class CustomBarChart extends StatelessWidget {
  CustomBarChart({super.key});

  final carbohydrateColor = Colors.red.shade300;
  final fatColor = Colors.yellow.shade400;
  final proteinColor = Colors.orange.shade300;
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double carbohydrates,
    double protein,
    double fat,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: carbohydrates,
          color: carbohydrateColor,
          width: 10,
        ),
        BarChartRodData(
          fromY: carbohydrates + betweenSpace,
          toY: carbohydrates + betweenSpace + protein,
          color: proteinColor,
          width: 10,
        ),
        BarChartRodData(
          fromY: carbohydrates + betweenSpace + protein + betweenSpace,
          toY: carbohydrates + betweenSpace + protein + betweenSpace + fat,
          color: fatColor,
          width: 10,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '월';
        break;
      case 1:
        text = '화';
        break;
      case 2:
        text = '수';
        break;
      case 3:
        text = '목';
        break;
      case 4:
        text = '금';
        break;
      case 5:
        text = '토';
        break;
      case 6:
        text = '일';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LegendsListWidget(
            legends: [
              Legend('탄수화물', carbohydrateColor),
              Legend('단백질', proteinColor),
              Legend('지방', fatColor),
            ],
          ),
          const SizedBox(height: 5),
          AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 24,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: true),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 2.0, 3.0, 2.0),
                  generateGroupData(1, 1.0, 2.0, 3.0),
                  generateGroupData(2, 1.3, 3.1, 2.8),
                  generateGroupData(3, 3.1, 4.2, 3.1),
                  generateGroupData(4, 0.8, 3.3, 3.4),
                  generateGroupData(5, 2.0, 5.6, 1.8),
                  generateGroupData(6, 1.3, 3.2, 2.0),
                ],
                maxY: 11 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 3.3,
                      color: carbohydrateColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 8,
                      color: proteinColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 11,
                      color: fatColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}