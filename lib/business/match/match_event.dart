abstract class MatchEvent {}

class LoadMatches extends MatchEvent {}

class LoadMatchById extends MatchEvent {
  final String id;
  LoadMatchById(this.id);
}
