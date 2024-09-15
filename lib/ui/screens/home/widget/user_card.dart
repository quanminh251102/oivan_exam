// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../main_page.dart';

class _UserCard extends StatefulWidget {
  final UIUserDto userDto;
  final bool isBookmarked;

  const _UserCard({
    required this.userDto,
    required this.isBookmarked,
  });

  @override
  __UserCardState createState() => __UserCardState();
}

class __UserCardState extends State<_UserCard> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.isBookmarked;
  }

  void _toggleBookmark() async {
    final dbHelper = DatabaseHelper();

    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    if (_isBookmarked) {
      await dbHelper.bookmarkUser(widget.userDto.userId!);
    } else {
      await dbHelper.unbookmarkUser(widget.userDto.userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.toNamed(
              MyRouter.detail,
              arguments: widget.userDto,
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CachedNetworkImage(
                            imageUrl: widget.userDto.profileImage ??
                                'https://via.placeholder.com/300x150',
                            placeholder: (context, url) => const CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 30,
                            ),
                            imageBuilder: (context, image) => CircleAvatar(
                              backgroundImage: image,
                              radius: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // User Info Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userDto.displayName!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (widget.userDto.location != null)
                              IconText(
                                icon: Icons.location_on,
                                text: widget.userDto.location!,
                              ),
                            IconText(
                              icon: Icons.timelapse_sharp,
                              text:
                                  'Member since: ${_formatDate(widget.userDto.creationDate)}',
                            ),
                            IconText(
                              icon: Icons.access_alarm,
                              text:
                                  'Last access: ${_formatDate(widget.userDto.lastAccessDate)}',
                            ),
                          ],
                        ),
                      ),
                      // Bookmark Icon
                      Consumer<IHomeViewModel>(
                        builder: (context, vm, child) {
                          return !vm.showOnlyBookmarked
                              ? IconButton(
                                  icon: Icon(
                                    _isBookmarked
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color: _isBookmarked
                                        ? Colors.yellow
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    _toggleBookmark();
                                    vm.updateUser(
                                      widget.userDto.userId!,
                                      _isBookmarked,
                                    );
                                  },
                                )
                              : const SizedBox.shrink();
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatRow(
                            'Reputation',
                            widget.userDto.reputation!.toString(),
                            Icons.insert_chart_outlined_rounded,
                            Colors.amber),
                        _buildStatRow(
                            'Accept Rate',
                            '${widget.userDto.acceptRate ?? 0}%',
                            Icons.check,
                            Colors.green),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildBadge('Gold', widget.userDto.badgeCounts!.gold!,
                              Colors.amber),
                          _buildBadge('Silver',
                              widget.userDto.badgeCounts!.silver!, Colors.grey),
                          _buildBadge(
                              'Bronze',
                              widget.userDto.badgeCounts!.bronze!,
                              Colors.brown),
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(MyRouter.detail,
                            arguments: widget.userDto),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'More details',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  String _formatDate(int? timestamp) {
    if (timestamp == null) return 'N/A';
    return DateFormat('MMM d, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  Widget _buildStatRow(
      String label, String value, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: iconColor,
          ),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildMetricItem({
    required String label,
    required String value,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(String label, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.circle,
              size: 10,
              color: color,
            ),
            Text(
              count.toString(),
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
