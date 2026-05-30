import 'detection_decision.dart';

class RiskScore {
  const RiskScore({
    required this.value,
    required this.decision,
    required this.reasons,
  });

  final int value;
  final DetectionDecision decision;
  final List<String> reasons;
}
