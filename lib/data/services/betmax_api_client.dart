import 'package:betmax_app_master/config/config.dart';
import 'package:betmax_app_master/data/models/match_detail_response.dart';
import 'package:betmax_app_master/data/models/match_response.dart';
import 'package:dio/dio.dart';

class BetmaxApiClient {
  final Dio dio;

  BetmaxApiClient() : dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));

  Future<MatchResponse> fetchMatches() async {
    try {
      final response = await dio.get('/matches');
      if (response.statusCode == 200) {
        return MatchResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load matches");
      }
    } catch (e) {
      throw Exception("Error fetching matches: $e");
    }
  }

  Future<MatchDetailResponse> fetchMatchDetail(String ntId) async {
    try {
      final response = await dio.get('/matches/$ntId');
      if (response.statusCode == 200) {
        return MatchDetailResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load match detail");
      }
    } catch (e) {
      throw Exception("Error fetching match detail: $e");
    }
  }
}
