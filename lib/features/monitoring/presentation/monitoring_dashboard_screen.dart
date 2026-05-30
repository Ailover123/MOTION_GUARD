import 'package:flutter/material.dart';

class MonitoringDashboardScreen extends StatefulWidget {
  const MonitoringDashboardScreen({super.key});

  static const routePath = '/monitoring';

  @override
  State<MonitoringDashboardScreen> createState() =>
      _MonitoringDashboardScreenState();
}

class _MonitoringDashboardScreenState extends State<MonitoringDashboardScreen> {
  bool _isMonitoring = false;

  void _toggleMonitoring() {
    setState(() => _isMonitoring = !_isMonitoring);
  }

  @override
  Widget build(BuildContext context) {
    final statusText =
        _isMonitoring ? 'Monitoring is running' : 'Monitoring is not running';

    return Scaffold(
      appBar: AppBar(title: const Text('Monitoring')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              statusText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              'The dashboard will show sensor availability, risk state, '
              'telemetry queue status, and alarm controls as the native bridge '
              'and backend come online.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Risk state',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('NORMAL'),
                        Chip(
                          label: Text('NORMAL'),
                          backgroundColor: Color(0xFFDFF3E0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text('Sensor availability: Unknown',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Icon(Icons.speed),
                          SizedBox(height: 8),
                          Text('Accelerometer'),
                          SizedBox(height: 4),
                          Text('Status: Unknown'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Icon(Icons.rotate_right),
                          SizedBox(height: 8),
                          Text('Gyroscope'),
                          SizedBox(height: 4),
                          Text('Status: Unknown'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _toggleMonitoring,
              child:
                  Text(_isMonitoring ? 'Stop Monitoring' : 'Start Monitoring'),
            ),
          ],
        ),
      ),
    );
  }
}
