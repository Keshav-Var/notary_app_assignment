import 'package:flutter/material.dart';
import 'package:notary_app_assignment/data/home_remote_data_source.dart';
import 'package:notary_app_assignment/data/models/continue_watching_model.dart';
import 'package:notary_app_assignment/data/models/header_model.dart';
import 'package:notary_app_assignment/data/models/home_response_model.dart';
import 'package:notary_app_assignment/data/models/popular_video_model.dart';
import 'package:notary_app_assignment/data/models/yoga_category_model.dart';
import 'package:notary_app_assignment/network/api_client.dart';
import 'package:notary_app_assignment/ui/widgets/continue_watching_section.dart';
import 'package:notary_app_assignment/ui/widgets/popular_video_sectoin.dart';
import 'package:notary_app_assignment/ui/widgets/yoga_categories_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeRemoteDataSource _homeRemoteDataSource;
  late Future<HomeResponseModel> _homeFuture;

  @override
  void initState() {
    super.initState();
    _homeRemoteDataSource = HomeRemoteDataSource(ApiClient());
    _homeFuture = _homeRemoteDataSource.fetchHomeData('xyz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: _homeFuture,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (asyncSnapshot.hasError) {
              return const Center(child: Text("Something went wrong."));
            }
            final HomeResponseModel homeData = asyncSnapshot.data!;
            final HeaderModel headerData = homeData.header;
            final ContinueWatchingModel continueWatchingSection =
                homeData.continueWatching;
            final YogaCategoriesModel yogaCategories = homeData.yogaCategories;
            final PopularVideosModel popularVideos = homeData.popularVideos;
            List<String> greetings = headerData.greeting
                .split(',')
                .map((e) => e.trim())
                .toList();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${greetings[0]},",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              greetings.length > 1 ? greetings[1] : "",
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black26),
                          ),
                          child: Stack(
                            alignment: AlignmentGeometry.topRight,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.notifications_none,
                                  color: Colors.black54,
                                ),
                                onPressed: () {},
                              ),
                              if (headerData.notificationCount > 0)
                                Positioned(
                                  top: 14,
                                  right: 14,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 5,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: headerData.searchPlaceholder,
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.filter_alt_rounded,
                              color: Colors.black54,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ▶ Continue Watching
                  ContinueWatchingSection(items: continueWatchingSection),

                  const SizedBox(height: 24),

                  /// 🧘 Yoga Categories
                  YogaCategoriesSection(categories: yogaCategories),

                  const SizedBox(height: 24),

                  /// 🔥 Popular Videos
                  PopularVideosSection(videos: popularVideos),

                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
