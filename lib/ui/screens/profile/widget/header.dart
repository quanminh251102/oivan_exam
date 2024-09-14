// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _Header extends StatelessWidget {
  final UIUserDto userDto;
  const _Header({
    required this.userDto,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
            ),
            child: CachedNetworkImage(
              imageUrl:
                  userDto.profileImage ?? 'https://via.placeholder.com/300x150',
              placeholder: (context, url) => const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 35,
              ),
              imageBuilder: (context, image) => CircleAvatar(
                backgroundImage: image,
                radius: 35,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userDto.displayName ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (userDto.creationDate != null)
                IconText(
                  icon: Icons.cake_outlined,
                  text: DateTimeUtils.memberDuration(
                    userDto.creationDate!,
                  ),
                ),
              if (userDto.lastModifiedDate != null)
                IconText(
                  icon: Icons.lock_clock_outlined,
                  text: DateTimeUtils.timeAgo(
                    userDto.lastModifiedDate!,
                  ),
                ),
              if (userDto.location != null)
                IconText(
                  icon: Icons.place_outlined,
                  text: userDto.location!,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
