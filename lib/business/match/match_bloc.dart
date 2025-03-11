import 'package:betmax_app_master/business/match/match_event.dart';
import 'package:betmax_app_master/business/match/match_state.dart';
import 'package:betmax_app_master/data/repositories/betmax_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final BetmaxRepository betmaxRepository;

  MatchBloc({required this.betmaxRepository}) : super(MatchInitial()) {
    on<LoadMatches>(_onLoadMatches);
    on<LoadMatchById>(_onLoadMatchById);
  }

  Future<void> _onLoadMatches(
      LoadMatches event, Emitter<MatchState> emit) async {
    try {
      emit(MatchLoading());
      final matches = await betmaxRepository.getMatches();
      emit(MatchesLoaded(matches));
    } catch (e) {
      emit(MatchError('Failed to load matches: $e'));
    }
  }

  Future<void> _onLoadMatchById(
      LoadMatchById event, Emitter<MatchState> emit) async {
    try {
      emit(MatchLoading());
      final match = await betmaxRepository.getMatchDetail(event.ntId);
      emit(MatchLoadedById(match));
    } catch (e) {
      emit(MatchError('Failed to load match detail: $e'));
    }
  }
}
