import 'package:betmax_app_master/business/match/match_bloc.dart';
import 'package:betmax_app_master/business/match/match_event.dart';
import 'package:betmax_app_master/data/repositories/betmax_repository.dart';
import 'package:betmax_app_master/data/services/betmax_api_client.dart';
import 'package:betmax_app_master/presentation/screens/matches_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BetmaxRepository>(
          create: (context) =>
              BetmaxRepository(betmaxApiClient: BetmaxApiClient()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MatchBloc>(
            create: (context) => MatchBloc(
              betmaxRepository: context.read<BetmaxRepository>(),
            )..add(LoadMatches()),
          ),
        ],
        child: MaterialApp(
          title: 'Betmax',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MatchesScreen(),
        ),
      ),
    );
  }
}
