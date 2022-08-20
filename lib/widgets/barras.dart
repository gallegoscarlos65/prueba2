import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Barras extends StatefulWidget {
  const Barras({Key? key}) : super(key: key);

  @override
  State<Barras> createState() => _BarrasState();
}

class _BarrasState extends State<Barras> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: SfCartesianChart(
                // Chart title text
                title: ChartTitle(text: 'Half yearly sales analysis'),
                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
          // Initialize line series
          LineSeries<ChartData, String>(
              dataSource: [
                // Bind data source
                ChartData('Jan', 35),
                ChartData('Feb', 28),
                ChartData('Mar', 34),
                ChartData('Apr', 32),
                ChartData('May', 40)
              ],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ])));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
