// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _ReputationTile extends StatelessWidget {
  final ReputationGroupByTime group;
  final int totalReputation;
  final String totalReputationDisplay;

  const _ReputationTile({
    required this.group,
    required this.totalReputation,
    required this.totalReputationDisplay,
  });

  String extractReputationType(String? reputationHistoryType) {
    if (reputationHistoryType == null || reputationHistoryType.isEmpty) {
      return 'Unknown';
    }

    if (reputationHistoryType.startsWith('post_')) {
      return reputationHistoryType
          .replaceFirst('post_', '')
          .replaceAll('_', ' ');
    }

    return reputationHistoryType.replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateTimeUtils.formatDateWithSuffix(group.time!),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: totalReputation >= 0
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  totalReputationDisplay,
                  style: TextStyle(
                    fontSize: 14,
                    color: totalReputation >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        children: group.reputationList != null
            ? group.reputationList!.map((reputation) {
                return Column(
                  children: [
                    Card(
                      color: reputation.reputation_change! > 0
                          ? Color.fromARGB(255, 237, 255, 238)
                          : Color.fromARGB(255, 250, 235, 236),
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              "${reputation.reputation_change! > 0 ? '+' : ''}${reputation.reputation_change}",
                              style: TextStyle(
                                fontSize: 16,
                                color: reputation.reputation_change! > 0
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  reputation.reputation_change! > 0
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  color: reputation.reputation_change! > 0
                                      ? Colors.green
                                      : Colors.red,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  extractReputationType(
                                      reputation.reputation_history_type),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "ID: ${reputation.post_id}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          DateTimeUtils.timeAgo(reputation.creation_date!),
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList()
            : [],
      ),
    );
  }
}
