import 'package:betmax_app_master/presentation/widget/market_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:betmax_app_master/business/match/match_bloc.dart';
import 'package:betmax_app_master/business/match/match_event.dart';
import 'package:betmax_app_master/business/match/match_state.dart';

class MatchDetailScreen extends StatefulWidget {
  final String ntId;
  const MatchDetailScreen({Key? key, required this.ntId}) : super(key: key);

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Load the match data when the screen is initialized
    context.read<MatchBloc>().add(LoadMatchById(widget.ntId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Details'),
      ),
      body: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, state) {
          if (state is MatchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MatchLoadedById) {
            final match = state.match;
            // Build your UI with the match data
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(match.homeTeam, style: TextStyle(fontSize: 20)),
                  Text('vs', style: TextStyle(fontSize: 16)),
                  Text(match.awayTeam, style: TextStyle(fontSize: 20)),
                  ...match.markets.map((market) => MarketTile(market: market))
                ],
              ),
            );
          } else if (state is MatchError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
