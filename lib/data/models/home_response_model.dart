import 'header_model.dart';
import 'continue_watching_model.dart';
import 'yoga_category_model.dart';
import 'popular_video_model.dart';

class HomeResponseModel {
  final HeaderModel header;
  final ContinueWatchingModel continueWatching;
  final YogaCategoriesModel yogaCategories;
  final PopularVideosModel popularVideos;

  HomeResponseModel({
    required this.header,
    required this.continueWatching,
    required this.yogaCategories,
    required this.popularVideos,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      header: HeaderModel.fromJson(json['header']),
      continueWatching: ContinueWatchingModel.fromJson(
        json['continueWatching'],
      ),
      yogaCategories: YogaCategoriesModel.fromJson(json['yogaCategories']),
      popularVideos: PopularVideosModel.fromJson(json['popularVideos']),
    );
  }
}
