part of '../dashboard.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(enabled: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 1),
                  const FlSpot(1, 1),
                  const FlSpot(2, 3),
                  const FlSpot(3, 4),
                  const FlSpot(3, 5),
                  const FlSpot(4, 4)
                ],
                isCurved: true,
                barWidth: 2,
                belowBarData: BarAreaData(show: false),
                aboveBarData: BarAreaData(
                  show: false,
                  color: Colors.lightGreen.withOpacity(0.5),
                  applyCutOffY: true,
                ),
                dotData: const FlDotData(show: true),
              ),
            ],
            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: const AxisTitles(axisNameWidget: Text('Month'), axisNameSize: 56),
              leftTitles: AxisTitles(
                axisNameWidget: const Text('GHS'),
                axisNameSize: 32,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  getTitlesWidget: (dob, title) {
                    return Text(dob.toString());
                  },
                ),
              ),
              topTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
            ),
            gridData: const FlGridData(show: false),
          ),
        )),
      ]),
    );
  }
}
