// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../detail_page.dart';

class _TagsList extends StatelessWidget {
  final List<TagDto> tags;
  const _TagsList({
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: tags.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          int answerScore = tags[index].answer_score ?? 0;
          int questionScore = tags[index].question_score ?? 0;
          int totalScore = answerScore + questionScore;
          return _buildTagRow(
            tag: tags[index].tag_name ?? '',
            score: totalScore.toString(),
          );
        },
      ),
    );
  }
}

Widget _buildTagRow({
  required String tag,
  required String score,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          _buildTagLabel(tag),
          const SizedBox(width: 16),
        ],
      ),
      Text(
        '$score score',
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    ],
  );
}

Widget _buildTagLabel(String tag) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xff0ea473),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      tag,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
