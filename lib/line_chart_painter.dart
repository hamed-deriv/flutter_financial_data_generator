import 'package:flutter/material.dart';

class LineChartPainter extends CustomPainter {
  LineChartPainter({
    required this.data,
    required this.maxValue,
    required this.minValue,
  });

  final List<double> data;
  final double maxValue;
  final double minValue;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double xInterval = size.width / (data.length - 1);
    final double yInterval = size.height / (maxValue - minValue);

    for (int i = 0; i < data.length; i++) {
      final double x = i * xInterval;
      final double y = (maxValue - data[i]) * yInterval;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(LineChartPainter oldDelegate) =>
      oldDelegate.data != data ||
      oldDelegate.maxValue != maxValue ||
      oldDelegate.minValue != minValue;
}
