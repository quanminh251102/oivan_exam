part of '../detail_page.dart';

class _ReputationTab extends StatefulWidget {
  const _ReputationTab({super.key});

  @override
  State<_ReputationTab> createState() => __ReputationTabState();
}

class __ReputationTabState extends State<_ReputationTab> {
  final List<ReputationGroupByTime> reputationGroupByTimeList = [
    ReputationGroupByTime(
      time: DateTime(2023, 9, 12),
      reputationList: [
        ReputationHistoryDto(
          reputationHistoryType: "upvote",
          reputationChange: 10,
          postId: 1,
          creationDate: 1694505600,
          userId: 100,
        ),
        ReputationHistoryDto(
          reputationHistoryType: "downvote",
          reputationChange: -5,
          postId: 2,
          creationDate: 1694505600,
          userId: 101,
        ),
      ],
    ),
    ReputationGroupByTime(
      time: DateTime(2023, 9, 13),
      reputationList: [
        ReputationHistoryDto(
          reputationHistoryType: "post_upvoted",
          reputationChange: 15,
          postId: 3,
          creationDate: 1694592000,
          userId: 102,
        ),
      ],
    ),
    ReputationGroupByTime(
      time: DateTime(2023, 9, 14),
      reputationList: [
        ReputationHistoryDto(
          reputationHistoryType: "downvote",
          reputationChange: -10,
          postId: 4,
          creationDate: 1694678400,
          userId: 103,
        ),
        ReputationHistoryDto(
          reputationHistoryType: "post_upvoted",
          reputationChange: 20,
          postId: 5,
          creationDate: 1694678400,
          userId: 104,
        ),
      ],
    ),
  ];

  int currentPage = 0;
  int itemsPerPage = 2;
  int get totalPages {
    return (reputationGroupByTimeList.length / itemsPerPage).ceil();
  }

  int calculateTotalReputation(List<ReputationHistoryDto>? reputationList) {
    if (reputationList == null) return 0;
    return reputationList.fold(
        0, (total, item) => total + (item.reputationChange ?? 0));
  }

  List<ReputationGroupByTime> get paginatedReputationList {
    int start = currentPage * itemsPerPage;
    int end = start + itemsPerPage;
    return reputationGroupByTimeList.sublist(
        start,
        end > reputationGroupByTimeList.length
            ? reputationGroupByTimeList.length
            : end);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 8),
              //Reputation History
              Text('Reputation History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 5),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: paginatedReputationList.length,
          itemBuilder: (context, index) {
            var group = paginatedReputationList[index];
            int totalReputation =
                calculateTotalReputation(group.reputationList);
            String totalReputationDisplay =
                totalReputation >= 0 ? '+$totalReputation' : '$totalReputation';
            return Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${group.time?.toLocal().toString().split(' ')[0]}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 40,
                      padding: EdgeInsets.symmetric(vertical: 4),
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
                            color: totalReputation >= 0
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                children: group.reputationList != null
                    ? group.reputationList!.map((reputation) {
                        return Container(
                          decoration: BoxDecoration(
                            color: reputation.reputationChange! > 0
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
                                        "${reputation.reputationChange! > 0 ? '+' : ''}${reputation.reputationChange}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              reputation.reputationChange! > 0
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
                                      "${reputation.reputationHistoryType}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            title: Text(
                              "Post ID: ${reputation.postId}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              " ${DateTimeUtils.timeAgo(reputation.creationDate!)}",
                              style: const TextStyle(
                                  fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                          ),
                        );
                      }).toList()
                    : [],
              ),
            );
          },
        ),

        // Pagination controls with numbered buttons
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ElevatedButton(
        //         onPressed: currentPage > 0
        //             ? () {
        //                 setState(() {
        //                   currentPage = 0;
        //                 });
        //               }
        //             : null,
        //         child: Text("First"),
        //       ),
        //       SizedBox(width: 8),
        //       ElevatedButton(
        //         onPressed: currentPage > 0
        //             ? () {
        //                 setState(() {
        //                   currentPage--;
        //                 });
        //               }
        //             : null,
        //         child: Text("Previous"),
        //       ),
        //       SizedBox(width: 16),
        //       // Display numbered pagination
        //       Row(
        //         children: List.generate(totalPages, (pageIndex) {
        //           return Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 4.0),
        //             child: ElevatedButton(
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: pageIndex == currentPage
        //                     ? Colors.blue
        //                     : Colors.grey[300],
        //                 foregroundColor: pageIndex == currentPage
        //                     ? Colors.white
        //                     : Colors.black,
        //               ),
        //               onPressed: () {
        //                 setState(() {
        //                   currentPage = pageIndex;
        //                 });
        //               },
        //               child: Text("${pageIndex + 1}"),
        //             ),
        //           );
        //         }),
        //       ),
        //       SizedBox(width: 16),
        //       ElevatedButton(
        //         onPressed: (currentPage + 1) * itemsPerPage <
        //                 reputationGroupByTimeList.length
        //             ? () {
        //                 setState(() {
        //                   currentPage++;
        //                 });
        //               }
        //             : null,
        //         child: Text("Next"),
        //       ),
        //       SizedBox(width: 8),
        //       ElevatedButton(
        //         onPressed: currentPage < totalPages - 1
        //             ? () {
        //                 setState(() {
        //                   currentPage = totalPages - 1;
        //                 });
        //               }
        //             : null,
        //         child: Text("Last"),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
