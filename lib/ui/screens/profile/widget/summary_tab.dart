// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _SummaryTab extends StatefulWidget {
  final UIUserDto userDto;
  const _SummaryTab({
    required this.userDto,
  });

  @override
  State<_SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<_SummaryTab> {
  late IProfileViewModel _iProfileViewModel;
  @override
  void initState() {
    _iProfileViewModel = context.read<IProfileViewModel>();
    Future.delayed(
      Duration.zero,
      () async {
        await _iProfileViewModel.getUserTopTags(
          widget.userDto.userId!,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    // Badges Section
                    const SectionTitle(
                        title: 'Badges', icon: Icons.military_tech),
                    const SizedBox(height: 5),
                    if (widget.userDto.badgeCounts != null)
                      _BadgesWidget(
                        badges: widget.userDto.badgeCounts!,
                      ),
                    const SizedBox(height: 8),

                    // Stats Section
                    const SectionTitle(
                        title: 'Reputation changes',
                        icon: Icons.bar_chart), // Icon for Stats
                    const SizedBox(height: 5),
                    _StatsCard(
                      year: '${widget.userDto.reputationChangeYear}',
                      month: '${widget.userDto.reputationChangeMonth}',
                      week: '${widget.userDto.reputationChangeWeek}',
                      day: '${widget.userDto.reputationChangeDay}',
                      total: '${widget.userDto.reputation}',
                    ),

                    // Tags Section
                    const SizedBox(height: 8),
                    const SectionTitle(
                        title: 'Top tags', icon: Icons.tag), // Icon for Tags
                    const SizedBox(height: 5),
                    Consumer<IProfileViewModel>(
                      builder: (context, vm, child) {
                        return vm.tags.isNotEmpty
                            ? _TagsList(tags: vm.tags)
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Active Goals Section
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('ACTIVE  GOALS',
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          //       SizedBox(height: 16),
          //       _buildGoalItem(
          //           'ARTICLE', '10 design rules you must never break', '03/27'),
          //       SizedBox(height: 16),
          //       _buildGoalItem('VIDEO', 'Doing Field Studies Remotely', '03/1'),
          //       // Add more goal items as needed
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
