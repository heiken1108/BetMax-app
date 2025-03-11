import 'package:betmax_app_master/data/models/match_detail_model.dart';
import 'package:betmax_app_master/data/models/match_model.dart';

abstract class MatchState {}

class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchesLoaded extends MatchState {
  final List<MatchModel> matches;
  MatchesLoaded(this.matches);
}

class MatchLoadedById extends MatchState {
  final MatchDetailModel match;
  MatchLoadedById(this.match);
}

class MatchError extends MatchState {
  final String message;
  MatchError(this.message);
}
