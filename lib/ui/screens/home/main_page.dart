import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:oivan_exam/core/database/db_helper.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
import 'package:oivan_exam/global/router.dart';
import 'package:oivan_exam/ui/common_widgets/icon_text.dart';
import 'package:oivan_exam/ui/utils/loading_dialog_utils.dart';
import 'package:provider/provider.dart';

part './widget/user_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late IHomeViewModel _iHomeViewModel;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _iHomeViewModel = context.read<IHomeViewModel>();
    _scrollController.addListener(
      () async {
        await _onScroll();
      },
    );
    Future.delayed(
      Duration.zero,
      () async {
        await _iHomeViewModel.initGetUsers();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await _iHomeViewModel.getMoreUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Lottie.asset(
                  'assets/lottie/recommend-flame.json',
                  fit: BoxFit.fill,
                  height: 40,
                  width: 30,
                ),
                const Text(
                  'Top users',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Show only favorites',
                  style: TextStyle(fontSize: 14),
                ),
                Consumer<IHomeViewModel>(
                  builder: (context, vm, child) {
                    return Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: vm.showOnlyBookmarked,
                        onChanged: (value) {
                          vm.toggleFilter(value);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Consumer<IHomeViewModel>(
            builder: (context, vm, child) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index < vm.users.length) {
                          UIUserDto userDto = vm.users[index].clone();
                          return _UserCard(
                            isBookmarked: userDto.isBookmarked ?? false,
                            userDto: userDto,
                          );
                        }
                        return null;
                      },
                      childCount: vm.hasMoreData
                          ? vm.users.length + 1
                          : vm.users.length,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
