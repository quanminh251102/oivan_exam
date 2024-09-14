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
          elevation: 3, // Subtle shadow
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userDto.displayName ?? '',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place_outlined,
                              size: 15,
                            ),
                            Text(
                              userDto.location ?? '',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.yellow[700]),
                    SizedBox(width: 4),
                    Text(userDto.reputation.toString()),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${userDto.acceptRate}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Accept Rate',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle "More Details" button press here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Customize button color
                    minimumSize: Size.fromHeight(40), // Set button height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('More Details'),
                ),
              ],
            ),
          ),
        ));
  }
}
