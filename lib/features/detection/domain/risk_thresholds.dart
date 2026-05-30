class RiskThresholds {
  const RiskThresholds({
    this.suspectScore = 35,
    this.highRiskScore = 65,
    this.alertScore = 85,
    this.highVariance = 18,
    this.highMagnitude = 18,
    this.sustainedMotionSeconds = 4,
  });

  final int suspectScore;
  final int highRiskScore;
  final int alertScore;
  final double highVariance;
  final double highMagnitude;
  final int sustainedMotionSeconds;
}
