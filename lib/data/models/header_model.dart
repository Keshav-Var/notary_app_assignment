class HeaderModel {
  final String greeting;
  final int notificationCount;
  final String searchPlaceholder;
  final bool shareEnabled;

  HeaderModel({
    required this.greeting,
    required this.notificationCount,
    required this.searchPlaceholder,
    required this.shareEnabled,
  });

  factory HeaderModel.fromJson(Map<String, dynamic> json) {
    return HeaderModel(
      greeting: json['greeting'],
      notificationCount: json['notificationCount'],
      searchPlaceholder: json['searchPlaceholder'],
      shareEnabled: json['shareEnabled'],
    );
  }
}
