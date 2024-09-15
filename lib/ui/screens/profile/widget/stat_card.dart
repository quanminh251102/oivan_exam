// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _StatsCard extends StatelessWidget {
  final String year;
  final String month;
  final String week;
  final String day;
  final String total;
  const _StatsCard({
    required this.year,
    required this.month,
    required this.week,
    required this.day,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 234, 246, 253),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
          10,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildStatColumn(year, "Year"),
                      _buildStatColumn(month, "Month"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildStatColumn(week, "Week"),
                      _buildStatColumn(day, "Day"),
                    ],
                  ),
                ],
              ),
              _buildStatColumn(total, "Total"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(
                0xff0478BA,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
