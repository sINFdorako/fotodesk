import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesChart extends StatelessWidget {
  const SalesChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Y-axis title above the chart
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Verkäufe in €",
                style: TextStyle(
                    color: Color.fromARGB(255, 83, 83, 88),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // Actual LineChart
        Expanded(
            child: LineChart(
          sampleData1,
          duration: const Duration(milliseconds: 250),
          curve: Curves.bounceIn,
        )),
        // X-axis title below the chart
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Monat in Tagen",
              style: TextStyle(
                  color: Color.fromARGB(255, 67, 68, 75),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 31,
        maxY: 150,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.pink[400]!.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  Widget leftTitleWidgets(double value) {
    return Text(
      '€${value.toInt()}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }

  SideTitles leftTitles() => const SideTitles(
        showTitles: true,
        interval: 15,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    // This will just return the integer value of the day.
    String day = value.toInt().toString();

    return Text(day, style: style, textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        getTitlesWidget: (value, _) => bottomTitleWidgets(value),
        showTitles: true,
        reservedSize: 32,
        interval: 1,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: Colors.indigo[700]!.withOpacity(0.2), width: 4),
          left:
              BorderSide(color: Colors.indigo[700]!.withOpacity(0.2), width: 4),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.indigo[700]!,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 100),
          FlSpot(2, 3),
          FlSpot(3, 5),
          FlSpot(4, 60),
          FlSpot(5, 50),
          FlSpot(6, 80),
          FlSpot(7, 10),
          FlSpot(8, 3),
          FlSpot(9, 90),
          FlSpot(10, 3),
          FlSpot(11, 120),
          FlSpot(12, 70),
          FlSpot(13, 30),
          FlSpot(14, 5),
          FlSpot(15, 85),
          FlSpot(16, 55),
          FlSpot(17, 20),
          FlSpot(18, 3),
          FlSpot(19, 95),
          FlSpot(20, 25),
          FlSpot(21, 115),
          FlSpot(22, 75),
          FlSpot(23, 35),
          FlSpot(24, 10),
          FlSpot(25, 100),
          FlSpot(26, 45),
          FlSpot(27, 15),
          FlSpot(28, 5),
          FlSpot(29, 110),
          FlSpot(30, 65),
          FlSpot(31, 40),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink[400]!,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 0), // Start of month, no sales
          FlSpot(2, 5), // A few sales
          FlSpot(3, 3),
          FlSpot(4, 0), // No sales
          FlSpot(5, 2),
          FlSpot(6, 4),
          FlSpot(7, 8),
          FlSpot(8, 70), // Big sales, maybe after an event or campaign
          FlSpot(9, 50),
          FlSpot(10, 30),
          FlSpot(11, 10),
          FlSpot(12, 0), // No sales
          FlSpot(13, 5),
          FlSpot(14, 0), // No sales
          FlSpot(15, 4),
          FlSpot(16, 7),
          FlSpot(17, 0), // No sales
          FlSpot(18, 3),
          FlSpot(19, 5),
          FlSpot(20, 100), // Another boost in sales
          FlSpot(21, 60),
          FlSpot(22, 40),
          FlSpot(23, 20),
          FlSpot(24, 5),
          FlSpot(25, 2),
          FlSpot(26, 0), // No sales
          FlSpot(27, 3),
          FlSpot(28, 5),
          FlSpot(29, 4),
          FlSpot(30, 0), // No sales
        ],
      );
}
