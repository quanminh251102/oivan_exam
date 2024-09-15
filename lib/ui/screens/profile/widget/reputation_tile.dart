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
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: totalReputation >= 0
                    ? Colors.green.withOpacity(
                        0.1,
                      )
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
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
                    Container(
                      decoration: BoxDecoration(
                        color: reputation.reputation_change! > 0
                            ? Colors.green.withOpacity(
                                0.1,
                              )
                            : Colors.red.withOpacity(0.1),
                      ),
                      height: 50,
                      child: ListTile(
                        leading: SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                                child: Center(
                                  child: Text(
                                    "${reputation.reputation_change! > 0 ? '+' : ''}${reputation.reputation_change}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: reputation.reputation_change! > 0
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  extractReputationType(
                                      reputation.reputation_history_type),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          "ID: ${reputation.post_id}",
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        trailing: Text(
                          DateTimeUtils.timeAgo(reputation.creation_date!),
                          style: const TextStyle(
                              fontSize: 12, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2,
                    )
                  ],
                );
              }).toList()
            : [],
      ),
    );
  }
}
