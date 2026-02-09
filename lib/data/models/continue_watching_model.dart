class ContinueWatchingModel {
  final WorkoutModel current;
  final WorkoutModel next;
  final String viewAllLink;

  ContinueWatchingModel({
    required this.current,
    required this.next,
    required this.viewAllLink,
  });

  factory ContinueWatchingModel.fromJson(Map<String, dynamic> json) {
    return ContinueWatchingModel(
      current: WorkoutModel.fromJson(json['current']),
      next: WorkoutModel.fromJson(json['next']),
      viewAllLink: json['viewAllLink'],
    );
  }
}

class WorkoutModel {
  final String id;
  final String title;
  final List<String> tags;
  final String imageUrl;

  WorkoutModel({
    required this.id,
    required this.title,
    required this.tags,
    required this.imageUrl,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      title: json['title'],
      tags: List<String>.from(json['tags']),
      imageUrl: json['imageUrl'],
    );
  }
}
