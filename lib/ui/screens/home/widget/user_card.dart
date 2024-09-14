part of '../main_page.dart';

class _UserCard extends StatelessWidget {
  final UIUserDto userDto;
  const _UserCard({
    required this.userDto,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        MyRouter.detail,
        arguments: userDto.displayName ?? '',
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(
              0.1,
            ),
          ),
          width: 300,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: userDto.profileImage ??
                      'https://via.placeholder.com/300x150',
                  placeholder: (context, url) => const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 20,
                  ),
                  imageBuilder: (context, image) => CircleAvatar(
                    backgroundImage: image,
                    radius: 20,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userDto.displayName ?? "",
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            ' - ${userDto.reputation ?? 0}',
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        userDto.location.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
