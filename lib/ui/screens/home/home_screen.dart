import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(
                          0.1,
                        ),
                      ),
                      width: 300,
                      height: 100,
                      child: Container(
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
                            Column(
                              children: [
                                Row(
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList()),
            ),
          );
        },
      ),
    );
  }
}
