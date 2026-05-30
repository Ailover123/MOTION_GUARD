import 'detection_decision.dart';
import 'interaction_context.dart';
import 'motion_features.dart';
import 'risk_score.dart';
import 'risk_thresholds.dart';

class RiskEngine {
  const RiskEngine({this.thresholds = const RiskThresholds()});

  final RiskThresholds thresholds;

  RiskScore evaluate({
    required MotionFeatures motion,
    required InteractionContext interaction,
  }) {
    if (interaction.permissionDegraded) {
      return const RiskScore(
        value: 0,
        decision: DetectionDecision.degraded,
        reasons: ['Required monitoring permission is unavailable'],
      );
    }

    var score = 0;
    final reasons = <String>[];

    if (motion.averageMagnitude >= thresholds.highMagnitude) {
      score += 25;
      reasons.add('High acceleration magnitude');
    }

    if (motion.variance >= thresholds.highVariance) {
      score += 25;
      reasons.add('Erratic motion variance');
    }

    if (motion.sustainedMotionSeconds >= thresholds.sustainedMotionSeconds) {
      score += 20;
      reasons.add('Sustained motion window');
    }

    if (motion.possibleRemoval) {
      score += 25;
      reasons.add('Removal or pocket-exit signal');
    }

    if (interaction.screenUnlocked || interaction.userRecentlyInteracted) {
      // Slightly less aggressive veto so reasonable risk remains Suspect
      // for strong-motion scenarios after user interaction.
      score = (score * 0.4).round();
      reasons.add('Interaction veto reduced risk');
    }

    return RiskScore(
      value: score,
      decision: _decisionFor(score),
      reasons: reasons,
    );
  }

  DetectionDecision _decisionFor(int score) {
    if (score >= thresholds.alertScore) {
      return DetectionDecision.alert;
    }
    if (score >= thresholds.highRiskScore) {
      return DetectionDecision.highRisk;
    }
    if (score >= thresholds.suspectScore) {
      return DetectionDecision.suspect;
    }
    return DetectionDecision.normal;
  }
}
