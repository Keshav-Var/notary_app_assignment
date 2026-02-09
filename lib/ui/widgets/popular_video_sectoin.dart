import 'package:flutter/material.dart';
import 'package:notary_app_assignment/data/models/popular_video_model.dart';
import 'package:notary_app_assignment/ui/widgets/popular_video_card.dart';
import '../widgets/section_header.dart';

class PopularVideosSection extends StatelessWidget {
  final PopularVideosModel videos;

  const PopularVideosSection({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Popular Videos',
          actionText: 'See All',
          onActionTap: () {},
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: videos.list.length,
          itemBuilder: (_, index) {
            final item = videos.list[index];
            return PopularVideoListItem(
              title: item.title,
              details: item.details,
              kcal: item.stats.kcal,
              duration: item.stats.durationMin,
              thumbnailUrl: item.thumbnailUrl,
            );
          },
        ),
      ],
    );
  }
}
