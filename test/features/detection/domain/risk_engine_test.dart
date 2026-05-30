import 'package:motion_guard/features/detection/domain/detection_decision.dart';
import 'package:motion_guard/features/detection/domain/interaction_context.dart';
import 'package:motion_guard/features/detection/domain/motion_features.dart';
import 'package:motion_guard/features/detection/domain/risk_engine.dart';
import 'package:test/test.dart';

void main() {
  const engine = RiskEngine();

  test('returns alert for high-risk motion without interaction veto', () {
    final result = engine.evaluate(
      motion: const MotionFeatures(
        averageMagnitude: 22,
        variance: 30,
        sustainedMotionSeconds: 7,
        possibleRemoval: true,
      ),
      interaction: const InteractionContext(
        screenUnlocked: false,
        userRecentlyInteracted: false,
        permissionDegraded: false,
      ),
    );

    expect(result.decision, DetectionDecision.alert);
    expect(result.value, greaterThanOrEqualTo(85));
  });

  test('reduces risk when the user recently interacted', () {
    final result = engine.evaluate(
      motion: const MotionFeatures(
        averageMagnitude: 22,
        variance: 30,
        sustainedMotionSeconds: 7,
        possibleRemoval: true,
      ),
      interaction: const InteractionContext(
        screenUnlocked: true,
        userRecentlyInteracted: true,
        permissionDegraded: false,
      ),
    );

    expect(result.decision, DetectionDecision.suspect);
    expect(result.reasons, contains('Interaction veto reduced risk'));
  });

  test('returns degraded when required permissions are unavailable', () {
    final result = engine.evaluate(
      motion: const MotionFeatures(
        averageMagnitude: 0,
        variance: 0,
        sustainedMotionSeconds: 0,
        possibleRemoval: false,
      ),
      interaction: const InteractionContext(
        screenUnlocked: false,
        userRecentlyInteracted: false,
        permissionDegraded: true,
      ),
    );

    expect(result.decision, DetectionDecision.degraded);
  });
}
