import 'package:flutter/material.dart';

class YogaCategoryItem extends StatelessWidget {
  final String name;
  final int workouts;
  final String iconUrl;

  const YogaCategoryItem({
    super.key,
    required this.name,
    required this.workouts,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            '$workouts workouts',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 6),
          Image.network(iconUrl, height: 40),
        ],
      ),
    );
  }
}
