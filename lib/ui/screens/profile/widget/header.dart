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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff0ea473),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CachedNetworkImage(
                    imageUrl: userDto.profileImage ??
                        'https://via.placeholder.com/300x150',
                    placeholder: (context, url) => const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),
                    imageBuilder: (context, image) => CircleAvatar(
                      backgroundImage: image,
                      radius: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
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
                      text: 'Last seen from ${DateTimeUtils.timeAgo(
                        userDto.lastModifiedDate!,
                      )}',
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
        ),
      ),
    );
  }
}
