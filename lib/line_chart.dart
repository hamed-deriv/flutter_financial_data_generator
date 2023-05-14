import 'package:flutter/material.dart';

import 'package:flutter_financial_data_generator/line_chart_painter.dart';

class LineChart extends StatelessWidget {
  const LineChart({required this.data, super.key});

  final List<double> data;

  @override
  Widget build(BuildContext context) {
    final double maxValue = data
        .reduce(
            (double value, double element) => value > element ? value : element)
        .toDouble();
    final double minValue = data
        .reduce(
            (double value, double element) => value < element ? value : element)
        .toDouble();

    return CustomPaint(
      size: const Size(double.infinity, 200),
      painter:
          LineChartPainter(data: data, maxValue: maxValue, minValue: minValue),
    );
  }
}
