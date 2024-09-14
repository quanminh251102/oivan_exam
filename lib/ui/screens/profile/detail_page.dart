import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/badge_count_dto.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/core/utils/date_time_extension.dart';
import 'package:oivan_exam/core/view_models/interfaces/iprofile_viewmodel.dart';
import 'package:oivan_exam/ui/common_widgets/icon_text.dart';
import 'package:provider/provider.dart';

part 'widget/badge_card.dart';
part 'widget/stat_card.dart';
part 'widget/tag_list.dart';
part 'widget/header.dart';
part 'widget/summary_tab.dart';
part 'widget/reputation_tab.dart';

class UserDetailPage extends StatefulWidget {
  final UIUserDto userDto;
  const UserDetailPage({
    super.key,
    required this.userDto,
  });

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButton(),
          //Header
          _Header(
            userDto: widget.userDto,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Summary'),
                      Tab(text: 'Reputation'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _SummaryTab(
                          userDto: widget.userDto,
                        ),
                        const _ReputationTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Progress Bar and Position
          // ... rest of the content (Profile, Feed, Progress, etc.)
        ],
      ),
    );
  }
}
