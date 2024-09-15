// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _BadgesWidget extends StatelessWidget {
  final BadgeCountDto badges;
  const _BadgesWidget({
    required this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _BadgeCard(
            title: 'gold',
            count: badges.gold ?? 0,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: _BadgeCard(
            title: 'silver',
            count: badges.silver ?? 0,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: _BadgeCard(
            title: 'bronze',
            count: badges.bronze ?? 0,
          ),
        ),
      ],
    );
  }
}

class _BadgeCard extends StatelessWidget {
  final String title;
  final int count;

  const _BadgeCard({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: title == 'gold'
            ? Colors.amber.withOpacity(0.3)
            : title == 'silver'
                ? Colors.grey.withOpacity(0.3)
                : Colors.brown.withOpacity(
                    0.3,
                  ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/$title-badge.png',
                  height: 45,
                  width: 45,
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: title == 'gold'
                            ? Colors.amber.withOpacity(1)
                            : title == 'silver'
                                ? Colors.grey.withOpacity(1)
                                : Colors.brown.withOpacity(
                                    1,
                                  ),
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
