class MotionFeatures {
  const MotionFeatures({
    required this.averageMagnitude,
    required this.variance,
    required this.sustainedMotionSeconds,
    required this.possibleRemoval,
  });

  final double averageMagnitude;
  final double variance;
  final int sustainedMotionSeconds;
  final bool possibleRemoval;
}
