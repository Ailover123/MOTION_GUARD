import 'package:flutter/services.dart';

class MotionGuardChannels {
  const MotionGuardChannels._();

  static const MethodChannel monitoring =
      MethodChannel('com.motionguard/monitoring');
  static const EventChannel sensors = EventChannel('com.motionguard/sensors');
  static const EventChannel lockAttempts =
      EventChannel('com.motionguard/lock_attempts');
}
