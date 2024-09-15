import 'package:flutter/material.dart';
import 'package:oivan_exam/ui/screens/home/main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: MainPage(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/50'),
            radius: 20,
          ),
          SizedBox(width: 10),
          Text(
            'Oivan Stack',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
