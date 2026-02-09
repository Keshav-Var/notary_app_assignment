import 'package:flutter/material.dart';
import 'package:notary_app_assignment/data/models/continue_watching_model.dart';
import 'package:notary_app_assignment/ui/widgets/continue_watching_cards.dart';
import '../widgets/section_header.dart';

class ContinueWatchingSection extends StatelessWidget {
  final ContinueWatchingModel items;

  const ContinueWatchingSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Continue Watching',
          actionText: 'View All',
          onActionTap: () {},
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,

            children: [
              ContinueWatchingCard(
                title: items.current.title,
                tags: items.current.tags,
                imageUrl: items.current.imageUrl,
              ),
              ContinueWatchingCard(
                title: items.next.title,
                tags: items.next.tags,
                imageUrl: items.next.imageUrl,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
