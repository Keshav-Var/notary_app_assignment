class YogaCategoriesModel {
  final List<YogaCategoryModel> list;
  final String viewAllLink;

  YogaCategoriesModel({required this.list, required this.viewAllLink});

  factory YogaCategoriesModel.fromJson(Map<String, dynamic> json) {
    return YogaCategoriesModel(
      list: (json['list'] as List)
          .map((e) => YogaCategoryModel.fromJson(e))
          .toList(),
      viewAllLink: json['viewAllLink'],
    );
  }
}

class YogaCategoryModel {
  final String id;
  final String name;
  final int workouts;
  final String iconUrl;

  YogaCategoryModel({
    required this.id,
    required this.name,
    required this.workouts,
    required this.iconUrl,
  });

  factory YogaCategoryModel.fromJson(Map<String, dynamic> json) {
    return YogaCategoryModel(
      id: json['id'],
      name: json['name'],
      workouts: json['workouts'],
      iconUrl: json['iconUrl'],
    );
  }
}
