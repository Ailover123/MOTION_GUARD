import 'motion_features.dart';
import 'sensor_sample.dart';

class MotionFeatureExtractor {
  const MotionFeatureExtractor();

  MotionFeatures extract(List<SensorSample> samples) {
    if (samples.isEmpty) {
      return const MotionFeatures(
        averageMagnitude: 0,
        variance: 0,
        sustainedMotionSeconds: 0,
        possibleRemoval: false,
      );
    }

    final magnitudes = samples.map((sample) => sample.magnitude).toList();
    final average = magnitudes.reduce((a, b) => a + b) / magnitudes.length;
    final variance = magnitudes
            .map((magnitude) => _squared(magnitude - average))
            .reduce((a, b) => a + b) /
        magnitudes.length;
    final duration = samples.last.timestamp.difference(samples.first.timestamp);

    return MotionFeatures(
      averageMagnitude: average,
      variance: variance,
      sustainedMotionSeconds: duration.inSeconds,
      possibleRemoval: average > 14 && variance > 8,
    );
  }

  double _squared(double value) => value * value;
}
