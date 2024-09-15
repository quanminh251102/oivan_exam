part of '../detail_page.dart';

class _ReputationTab extends StatefulWidget {
  final UIUserDto userDto;
  const _ReputationTab({
    required this.userDto,
  });

  @override
  State<_ReputationTab> createState() => __ReputationTabState();
}

class __ReputationTabState extends State<_ReputationTab> {
  late IProfileViewModel _iProfileViewModel;
  @override
  void initState() {
    _iProfileViewModel = context.read<IProfileViewModel>();
    Future.delayed(
      Duration.zero,
      () async {
        await _iProfileViewModel.getUserReputation(
          widget.userDto.userId!,
        );
      },
    );
    super.initState();
  }

  int calculateTotalReputation(List<ReputationHistoryDto>? reputationList) {
    if (reputationList == null) return 0;
    return reputationList.fold(
        0, (total, item) => total + (item.reputation_change ?? 0));
  }

  List<FlSpot> _createLineChartSpots(List<ReputationHistoryDto> data) {
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(
        i.toDouble(),
        (data[i].reputation_change ?? 0).toDouble(),
      ));
    }
    return spots;
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    final time = DateTime.fromMillisecondsSinceEpoch(
        (value * 24 * 60 * 60 * 1000).toInt());
    final formattedTime = '${time.day}/${time.month}';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(formattedTime),
    );
  }

  String _formatDate(int epochTime) {
    var date = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
    return DateFormat('MMM d').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
            ),
            child: Text('Reputation Chart',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Consumer<IProfileViewModel>(
            builder: (context, vm, child) {
              return _ReputationChart(
                totalReputation: widget.userDto.reputation ?? 0,
                reputationHistoryList: vm.reputations,
              );
            },
          ),
          //Reputation History
          const Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
            ),
            child: Text('Reputation History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),

          Consumer<IProfileViewModel>(
            builder: (context, vm, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: vm.reputationGroupByTime.length,
                        itemBuilder: (context, index) {
                          var group = vm.reputationGroupByTime[index];
                          int totalReputation =
                              calculateTotalReputation(group.reputationList);
                          String totalReputationDisplay = totalReputation >= 0
                              ? '+$totalReputation'
                              : '$totalReputation';
                          return _ReputationTile(
                            group: group,
                            totalReputation: totalReputation,
                            totalReputationDisplay: totalReputationDisplay,
                          );
                        },
                      ),
                      if (vm.reputationGroupByTime.isNotEmpty)
                        SizedBox(
                          width: size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () async {
                              await _iProfileViewModel.getMoreReputation(
                                widget.userDto.userId!,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color: Color(0xff065FC4))),
                            ),
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                color: Color(0xff065FC4),
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: size.height * 0.05,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
