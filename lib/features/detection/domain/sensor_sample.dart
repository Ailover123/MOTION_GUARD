import 'dart:math';

class SensorSample {
  const SensorSample({
    required this.timestamp,
    required this.x,
    required this.y,
    required this.z,
  });

  final DateTime timestamp;
  final double x;
  final double y;
  final double z;

  double get magnitude => sqrt((x * x) + (y * y) + (z * z));
}
