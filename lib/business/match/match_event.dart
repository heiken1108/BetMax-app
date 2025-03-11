abstract class MatchEvent {}

class LoadMatches extends MatchEvent {}

class LoadMatchById extends MatchEvent {
  final String ntId;
  LoadMatchById(this.ntId);
}
