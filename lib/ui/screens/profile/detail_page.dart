import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
part 'widget/reputation_tile.dart';
part 'widget/reputation_chart.dart';

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
  bool isBarChartSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'User detail',
          ),
        ),
        backgroundColor: Color(0xffEDF1F8),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // Header
            _Header(
              userDto: widget.userDto,
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBarChartSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                isBarChartSelected ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info,
                                  color: isBarChartSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Information",
                                  style: TextStyle(
                                    color: isBarChartSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Line Chart Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBarChartSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isBarChartSelected
                                ? Colors.blue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.show_chart,
                                  color: !isBarChartSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Reputations",
                                  style: TextStyle(
                                    color: !isBarChartSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: isBarChartSelected
                  ? _SummaryTab(
                      userDto: widget.userDto,
                    )
                  : _ReputationTab(
                      userDto: widget.userDto,
                    ),
            ),
          ],
        ));
  }
}
