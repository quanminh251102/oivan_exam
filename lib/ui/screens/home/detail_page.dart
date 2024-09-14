import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  final String userName;
  const UserDetailPage({
    super.key,
    required this.userName,
  });

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // To handle potential overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                Icon(Icons.settings), // Placeholder for settings icon
              ],
            ),
          ),
          // User Profile Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with user's image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Markus D.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Design lead',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 8),
                    Text('82 skillpoints', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Progress Bar and Position
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Chief esign officer', style: TextStyle(fontSize: 18)),
                SizedBox(height: 4),
                // You'd need a custom widget or library for a progress bar
                LinearProgressIndicator(
                  value: 0.6, // Example progress
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 8),
                Text('My goal in 15 year - 200 points',
                    style: TextStyle(fontSize: 14)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatCard('8', 'Goals in week'),
                    _buildStatCard('12', 'Days streak'),
                    _buildStatCard('4th', 'place'),
                  ],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem('Goals', Icons.flag),
                _buildNavItem('Courses', Icons.school),
                _buildNavItem('Tests', Icons.edit),
              ],
            ),
          ),

          SizedBox(height: 24),

          // Active Goals Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ACTIVE  GOALS',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                _buildGoalItem(
                    'ARTICLE', '10 design rules you must never break', '03/27'),
                SizedBox(height: 16),
                _buildGoalItem('VIDEO', 'Doing Field Studies Remotely', '03/1'),
                // Add more goal items as needed
              ],
            ),
          ),

          // ... rest of the content (Profile, Feed, Progress, etc.)
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildGoalItem(String type, String title, String date) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(type, style: TextStyle(fontSize: 12)),
              ),
              Spacer(),
              Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
