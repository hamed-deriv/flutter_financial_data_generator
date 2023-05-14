import 'dart:math';

List<double> generateMarketSequence(
  int length,
  double initialValue,
  double drift,
  double volatility,
) {
  final List<double> sequence = <double>[initialValue];

  for (int i = 1; i < length; i++) {
    final double previousValue = sequence[i - 1];
    final double standardNormal = nextGaussian(Random());
    final double newValue =
        previousValue + previousValue * (drift + volatility * standardNormal);

    sequence.add(newValue);
  }

  return sequence;
}

double nextGaussian(Random random) {
  final double uniformRandomNumberA = 1.0 - random.nextDouble();
  final double uniformRandomNumberB = 1.0 - random.nextDouble();

  final double standardNormal = sqrt(-2.0 * log(uniformRandomNumberA)) *
      cos(2.0 * pi * uniformRandomNumberB);

  return standardNormal;
}
