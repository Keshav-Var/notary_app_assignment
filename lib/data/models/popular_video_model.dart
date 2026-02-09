class PopularVideosModel {
  final List<PopularVideoModel> list;
  final String seeAllLink;

  PopularVideosModel({required this.list, required this.seeAllLink});

  factory PopularVideosModel.fromJson(Map<String, dynamic> json) {
    return PopularVideosModel(
      list: (json['list'] as List)
          .map((e) => PopularVideoModel.fromJson(e))
          .toList(),
      seeAllLink: json['seeAllLink'],
    );
  }
}

class PopularVideoModel {
  final String id;
  final String title;
  final VideoStatsModel stats;
  final String details;
  final String thumbnailUrl;

  PopularVideoModel({
    required this.id,
    required this.title,
    required this.stats,
    required this.details,
    required this.thumbnailUrl,
  });

  factory PopularVideoModel.fromJson(Map<String, dynamic> json) {
    return PopularVideoModel(
      id: json['id'],
      title: json['title'],
      stats: VideoStatsModel.fromJson(json['stats']),
      details: json['details'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class VideoStatsModel {
  final int kcal;
  final int durationMin;

  VideoStatsModel({required this.kcal, required this.durationMin});

  factory VideoStatsModel.fromJson(Map<String, dynamic> json) {
    return VideoStatsModel(
      kcal: json['kcal'],
      durationMin: json['durationMin'],
    );
  }
}
