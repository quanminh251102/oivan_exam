// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _ReputationChart extends StatefulWidget {
  final List<ReputationHistoryDto> reputationHistoryList;
  final int totalReputation;
  const _ReputationChart({
    required this.reputationHistoryList,
    required this.totalReputation,
  });

  @override
  _ReputationChartState createState() => _ReputationChartState();
}

class _ReputationChartState extends State<_ReputationChart> {
  bool showBarChart = true;
  int latestReputation = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (var element in widget.reputationHistoryList) {
      latestReputation += element.reputation_change!;
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xff0ea473),
                        width: 5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.totalReputation}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Total reputation",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xff0ea473),
                        width: 5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$latestReputation',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text("Latest reputation",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (widget.reputationHistoryList.isNotEmpty)
              Expanded(child: _buildLineChart()),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 40,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final date = DateTime.fromMillisecondsSinceEpoch(
                    widget.reputationHistoryList[value.toInt()].creation_date! *
                        1000);
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    DateFormat('MM/dd').format(
                      date,
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: _createLineSpots(),
            isCurved: true,
            color: const Color(0xff0ea473),
            barWidth: 3,
            dotData: const FlDotData(show: true),
          ),
        ],
        borderData: FlBorderData(show: false),
      ),
    );
  }

  List<FlSpot> _createLineSpots() {
    return List.generate(widget.reputationHistoryList.length, (i) {
      return FlSpot(
        i.toDouble(),
        (widget.reputationHistoryList[i].reputation_change ?? 0).toDouble(),
      );
    });
  }
}
