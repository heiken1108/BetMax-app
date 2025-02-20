import 'package:betmax_app_master/data/services/betmax_api_client.dart';
import 'package:betmax_app_master/data/models/match_model.dart';

class BetmaxRepository {
  final BetmaxApiClient betmaxApiClient;

  BetmaxRepository({required this.betmaxApiClient});

  Future<List<MatchModel>> getMatches() async {
    try {
      final response = await betmaxApiClient.fetchMatches();
      return response.matches;
    } catch (e) {
      throw Exception('Failed to get matches: $e');
    }
  }
}
