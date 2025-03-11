import 'package:betmax_app_master/data/models/match_model.dart';

class MatchResponse {
  final List<MatchModel> matches;

  MatchResponse({required this.matches});

  factory MatchResponse.fromJson(Map<String, dynamic> json) {
    return MatchResponse(
        matches: (json['eventList'] as List)
            .map((event) => MatchModel.fromJson(event))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {'eventList': matches.map((match) => match.toJson()).toList()};
  }
}


