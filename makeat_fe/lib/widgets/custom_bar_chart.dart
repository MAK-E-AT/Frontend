import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_legend.dart';


class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> with SingleTickerProviderStateMixin {
  
  final carbohydrateColor = Colors.red.shade300;
  final fatColor = Colors.yellow.shade400;
  final proteinColor = Colors.orange.shade300;
  final betweenSpace = 0.0;

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
          toY: carbohydrates + protein,
          color: proteinColor,
          width: 10,
        ),
        BarChartRodData(
          fromY: carbohydrates + betweenSpace + protein + betweenSpace,
          toY: carbohydrates + protein + fat,
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
      padding: const EdgeInsets.fromLTRB(24.0, 4.0, 24.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                barGroups: [  // 단위 : kcal
                  generateGroupData(0, 400, 600, 400),
                  generateGroupData(1, 300, 600, 900),
                  generateGroupData(2, 360, 640, 840),
                  generateGroupData(3, 640, 840, 310),
                  generateGroupData(4, 360, 770, 680),
                  generateGroupData(5, 400, 1120, 360),
                  generateGroupData(6, 390, 960, 500),
                ],
                maxY: 2200,  // 단위 : kcal
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    // 6.6 : 9.4 : 6 비율, 단위 : kcal
                    HorizontalLine(
                      y: 660,
                      color: carbohydrateColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 1600,
                      color: proteinColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 2200,
                      color: fatColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 18.0,),
          Align(
            alignment: Alignment.centerRight,
            child: LegendsListWidget(
              legends: [
                Legend('탄수화물', carbohydrateColor),
                Legend('단백질', proteinColor),
                Legend('지방', fatColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}