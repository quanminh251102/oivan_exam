import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
import 'package:oivan_exam/ui/screens/home/widget/user_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IHomeViewModel _iHomeViewModel;

  @override
  void initState() {
    _iHomeViewModel = context.read<IHomeViewModel>();
    Future.delayed(
      Duration.zero,
      () async {
        _iHomeViewModel.initGetUsers();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<IHomeViewModel>(
        builder: (context, vm, child) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                  children: vm.users.map(
                (user) {
                  UIUserDto userDto = user.clone();
                  return UserCard(userDto: userDto);
                },
              ).toList()),
            ),
          );
        },
      ),
    );
  }
}
