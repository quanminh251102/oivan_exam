// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../main_page.dart';

class _UserCard extends StatefulWidget {
  final UIUserDto userDto;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const _UserCard({
    required this.userDto,
    required this.isBookmarked,
    required this.onBookmarkToggle,
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

    widget.onBookmarkToggle();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.toNamed(
              MyRouter.detail,
              arguments: widget.userDto,
            ),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
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
                                    placeholder: (context, url) =>
                                        const CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 30,
                                    ),
                                    imageBuilder: (context, image) =>
                                        CircleAvatar(
                                      backgroundImage: image,
                                      radius: 30,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
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
                                    const SizedBox(height: 4),
                                    if (widget.userDto.location != null)
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            widget.userDto.location!,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(height: 8),
                                    _buildDateTimeRow(
                                        'Member Since',
                                        DateFormat('MMM d, yyyy')
                                            .format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    widget.userDto
                                                            .creationDate! *
                                                        1000))
                                            .toString()),
                                    _buildDateTimeRow(
                                        'Last Seen',
                                        DateFormat('MMM d, yyyy')
                                            .format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    widget.userDto
                                                            .lastAccessDate! *
                                                        1000))
                                            .toString()),
                                  ],
                                ),
                              ),
                              // Bookmark Icon
                              IconButton(
                                icon: Icon(
                                  _isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: _isBookmarked
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                                onPressed: _toggleBookmark,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Align badges to the left
                            children: [
                              _buildBadge(
                                  'Gold',
                                  widget.userDto.badgeCounts!.gold!,
                                  Colors.amber),
                              const SizedBox(width: 8),
                              _buildBadge(
                                  'Silver',
                                  widget.userDto.badgeCounts!.silver!,
                                  Colors.grey[300]!),
                              const SizedBox(width: 8),
                              _buildBadge(
                                  'Bronze',
                                  widget.userDto.badgeCounts!.bronze!,
                                  Colors.brown),
                            ],
                          ),
                          // Member Since & Last Seen

                          const SizedBox(height: 16),
                          _buildStatRow(
                              'Reputation',
                              widget.userDto.reputation!.toString(),
                              Icons.star,
                              Colors.amber),
                          _buildStatRow(
                              'Accept Rate',
                              '${widget.userDto.acceptRate}%',
                              Icons.check,
                              Colors.green),
                        ],
                      ),
                    ),
                  ],
                ),

                // Badge Section (below header)
              ],
            ),
          ),
        ));
  }

  Widget _buildDateTimeRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey, // Grey color for labels
          ),
        ),
        Text(value),
      ],
    );
  }

  Widget _buildBadge(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text for better contrast
            ),
          ),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
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
}
