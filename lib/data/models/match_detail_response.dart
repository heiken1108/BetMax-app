import 'package:betmax_app_master/data/models/match_detail_model.dart';

class MatchDetailResponse {
  final MatchDetailModel match;

  MatchDetailResponse({required this.match});

  factory MatchDetailResponse.fromJson(Map<String, dynamic> json) {
    return MatchDetailResponse(
      match: MatchDetailModel.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return match.toJson();
  }
}
