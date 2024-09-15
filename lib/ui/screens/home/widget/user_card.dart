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
              arguments: userDto,
            ),
        child: Card(
          color: Colors.white,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                          imageUrl: userDto.profileImage ??
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
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userDto.displayName ?? '',
                          style: const TextStyle(fontSize: 20),
                        ),
                        if (userDto.creationDate != null)
                          IconText(
                            icon: Icons.cake_outlined,
                            text: DateTimeUtils.memberDuration(
                              userDto.creationDate!,
                            ),
                          ),
                        if (userDto.location != null)
                          IconText(
                            icon: Icons.place_outlined,
                            text: userDto.location!,
                          ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.star, color: Colors.yellow[700]),
                    const SizedBox(width: 4),
                    Text(userDto.reputation.toString()),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: userDto.isEmployee!
                            ? Colors.green[100]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        userDto.isEmployee! ? 'Available Now' : 'Not Available',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              userDto.isEmployee! ? Colors.green : Colors.grey,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${userDto.acceptRate}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Accept Rate',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle "More Details" button press here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xff065FC4), // Customize button color
                    minimumSize: const Size.fromHeight(40), // Set button height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'More Details',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
