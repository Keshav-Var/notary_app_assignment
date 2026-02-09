import 'package:notary_app_assignment/data/models/home_response_model.dart';
import 'package:notary_app_assignment/network/api_client.dart';

class HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSource(this.apiClient);

  Future<HomeResponseModel> fetchHomeData(String userId) async {
    final response = await apiClient.post(
      '/api/home',
      data: {'userId': userId},
    );

    return HomeResponseModel.fromJson(response.data);
  }
}
