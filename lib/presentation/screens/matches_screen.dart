import 'package:betmax_app_master/business/match/match_bloc.dart';
import 'package:betmax_app_master/business/match/match_event.dart';
import 'package:betmax_app_master/business/match/match_state.dart';
import 'package:betmax_app_master/presentation/widget/match_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesScreen extends StatefulWidget {
  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<MatchBloc>().add(LoadMatches());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: RefreshIndicator(
          child: BlocBuilder<MatchBloc, MatchState>(builder: (context, state) {
        if (state is MatchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MatchesLoaded) {
          return ListView.builder(
              itemCount: state.matches.length,
              itemBuilder: (context, index) {
                return MatchCardTile(match: state.matches[index]);
              });
        } else if (state is MatchError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Container();
        }
      }), onRefresh: () async {
        context.read<MatchBloc>().add(LoadMatches());
        return await Future.delayed(Duration(seconds: 1));
      }),
    );
  }
}
