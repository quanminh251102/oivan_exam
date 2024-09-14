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
    // Future.delayed(
    //   Duration.zero,
    //   () async {
    //     await _iProfileViewModel.getUserTopTags(
    //       widget.userDto.userId!,
    //     );
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                //Badges
                const Text('Badges',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 5),
                if (widget.userDto.badgeCounts != null)
                  _BadgesWidget(
                    badges: widget.userDto.badgeCounts!,
                  ),
                const SizedBox(height: 8),

                //Stats
                const Text('Stats',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 5),
                _StatsCard(
                  year: '${widget.userDto.reputationChangeYear}',
                  month: '${widget.userDto.reputationChangeMonth}',
                  week: '${widget.userDto.reputationChangeWeek}',
                  day: '${widget.userDto.reputationChangeDay}',
                  total: '${widget.userDto.reputation}',
                ),

                //Tags
                const SizedBox(height: 8),
                const Text('Top tags',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
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

          SizedBox(height: 24),

          // Mentor Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with mentor's image
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Clarissa C. (My mentor)',
                        style: TextStyle(fontSize: 16)),
                    Text('Chief design officer',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {}, // Placeholder for chat action
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // Navigation Tabs (Goals, Courses, Tests)
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       _buildNavItem('Goals', Icons.flag),
          //       _buildNavItem('Courses', Icons.school),
          //       _buildNavItem('Tests', Icons.edit),
          //     ],
          //   ),
          // ),

          SizedBox(height: 24),

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
