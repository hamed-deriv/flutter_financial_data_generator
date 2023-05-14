import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_financial_data_generator/helpers.dart';
import 'package:flutter_financial_data_generator/line_chart.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<double> marketSequence = generateMarketSequence(10000, 100, 0.005, 0.1);

  int startIndex = 0;
  int endIndex = 200;
  bool enabled = true;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Market Sequence',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(elevation: 0, title: const Text('Market Sequence')),
          body: Container(
            color: Colors.black,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child:
                LineChart(data: marketSequence.sublist(startIndex, endIndex)),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: enabled
                ? () {
                    enabled = false;

                    Timer.periodic(
                      const Duration(milliseconds: 100),
                      (Timer timer) {
                        startIndex++;
                        endIndex++;

                        if (endIndex == marketSequence.length) {
                          startIndex = 0;
                          endIndex = 200;
                        }

                        setState(() {});
                      },
                    );
                  }
                : null,
          ),
        ),
      );
}
