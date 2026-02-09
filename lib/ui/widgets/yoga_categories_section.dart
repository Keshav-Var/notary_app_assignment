import 'package:flutter/material.dart';
import 'package:notary_app_assignment/data/models/yoga_category_model.dart';
import '../widgets/section_header.dart';
import '../widgets/yoga_category_item.dart';

class YogaCategoriesSection extends StatelessWidget {
  final YogaCategoriesModel categories;

  const YogaCategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Yoga Categories',
          actionText: 'View All',
          onActionTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: .9,
            ),
            itemCount: categories.list.length,
            itemBuilder: (_, index) {
              final item = categories.list[index];
              return YogaCategoryItem(
                name: item.name,
                workouts: item.workouts,
                iconUrl: item.iconUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}
