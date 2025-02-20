import 'package:betmax_app_master/data/models/match_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchCardTile extends StatelessWidget {
  final MatchModel match;
  MatchCardTile({required this.match});

  @override
  Widget build(BuildContext context) {
    Color evHomeColor =
        match.expectedValue.home > 1 ? Colors.green : Colors.red;
    Color evDrawColor =
        match.expectedValue.draw > 1 ? Colors.green : Colors.red;
    Color evAwayColor =
        match.expectedValue.away > 1 ? Colors.green : Colors.red;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(match.tournament),
              Text(DateFormat('HH:mm dd/MM').format(match.startTime))
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                    '${match.homeTeam} (${match.elo.homeElo.toStringAsFixed(1)})',
                    softWrap: true,
                    overflow: TextOverflow.clip),
              ),
              Flexible(
                child: Text(
                    '${match.awayTeam} (${match.elo.awayElo.toStringAsFixed(1)})',
                    softWrap: true,
                    overflow: TextOverflow.clip),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Sannsynligheter:'),
            ],
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('${(match.elo.eloProbs.home * 100).toStringAsFixed(2)}%'),
            Text('${(match.elo.eloProbs.draw * 100).toStringAsFixed(2)}%'),
            Text('${(match.elo.eloProbs.away * 100).toStringAsFixed(2)}%')
          ]),
          SizedBox(height: 8),
          // Horisontal bar for å visualisere prosentene
          Row(
            children: [
              // Home bar
              Expanded(
                flex: (match.elo.eloProbs.home * 100)
                    .toInt(), // Skalerer bredden basert på prosentandel
                child: Container(
                  height: 20,
                  color: Colors.green,
                ),
              ),
              // Draw bar
              Expanded(
                flex: (match.elo.eloProbs.draw * 100).toInt(),
                child: Container(
                  height: 20,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                flex: (match.elo.eloProbs.away * 100).toInt(),
                child: Container(
                  height: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('HUB Norsk Tipping:'),
            ],
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('${match.odds.home}'),
            Text('${match.odds.draw}'),
            Text('${match.odds.away}')
          ]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Forventingsverdi pr. krone:'),
            ],
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(match.expectedValue.home.toStringAsFixed(3),
                style: TextStyle(color: evHomeColor)),
            Text(match.expectedValue.draw.toStringAsFixed(3),
                style: TextStyle(color: evDrawColor)),
            Text(match.expectedValue.away.toStringAsFixed(3),
                style: TextStyle(color: evAwayColor)),
          ]),
        ],
      ),
    );
  }
}
