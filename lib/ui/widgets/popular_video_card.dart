import 'package:flutter/material.dart';

class PopularVideoListItem extends StatelessWidget {
  final String title;
  final String details;
  final int kcal;
  final int duration;
  final String thumbnailUrl;

  const PopularVideoListItem({
    super.key,
    required this.title,
    required this.details,
    required this.kcal,
    required this.duration,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              thumbnailUrl,
              width: 80,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          /// Right content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                /// kcal + duration row
                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      size: 14,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4),
                    Text('$kcal kcal', style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 12),
                    const Icon(Icons.access_time, size: 14, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text('$duration min', style: const TextStyle(fontSize: 12)),
                  ],
                ),

                const SizedBox(height: 6),

                /// Details
                Text(
                  details,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
