import 'package:motion_guard/features/detection/domain/motion_feature_extractor.dart';
import 'package:motion_guard/features/detection/domain/sensor_sample.dart';
import 'package:test/test.dart';

void main() {
  const extractor = MotionFeatureExtractor();

  test('extracts empty features for no samples', () {
    final features = extractor.extract(const []);

    expect(features.averageMagnitude, 0);
    expect(features.variance, 0);
    expect(features.sustainedMotionSeconds, 0);
    expect(features.possibleRemoval, isFalse);
  });

  test('calculates magnitude summary from accelerometer samples', () {
    final start = DateTime.utc(2026);
    final features = extractor.extract([
      SensorSample(timestamp: start, x: 12, y: 0, z: 0),
      SensorSample(
          timestamp: start.add(const Duration(seconds: 2)), x: 0, y: 18, z: 0),
      SensorSample(
          timestamp: start.add(const Duration(seconds: 5)), x: 24, y: 0, z: 0),
    ]);

    expect(features.averageMagnitude, closeTo(18, 0.01));
    expect(features.variance, greaterThan(0));
    expect(features.sustainedMotionSeconds, 5);
    expect(features.possibleRemoval, isTrue);
  });
}
