import 'package:betmax_app_master/data/models/match_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchCardTile extends StatelessWidget {
  final MatchModel match;

  const MatchCardTile({
    super.key,
    required this.match,
  });

  Color _getEvColor(double value) {
    return value > 1 ? Colors.green.shade600 : Colors.red.shade600;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header - Tournament and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  match.tournament,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat('HH:mm dd/MM').format(match.startTime),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Teams
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        match.homeTeam,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'ELO: ${match.elo.homeElo.toStringAsFixed(1)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'vs',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        match.awayTeam,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'ELO: ${match.elo.awayElo.toStringAsFixed(1)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Probabilities
            const Text(
              'Win Probabilities',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${(match.elo.eloProbs.home * 100).toStringAsFixed(1)}%'),
                Text('${(match.elo.eloProbs.draw * 100).toStringAsFixed(1)}%'),
                Text('${(match.elo.eloProbs.away * 100).toStringAsFixed(1)}%'),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Row(
                children: [
                  Expanded(
                    flex: (match.elo.eloProbs.home * 100).toInt(),
                    child: Container(
                      height: 8,
                      color: Colors.green.shade500,
                    ),
                  ),
                  Expanded(
                    flex: (match.elo.eloProbs.draw * 100).toInt(),
                    child: Container(
                      height: 8,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Expanded(
                    flex: (match.elo.eloProbs.away * 100).toInt(),
                    child: Container(
                      height: 8,
                      color: Colors.red.shade500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Odds
            const Text(
              'HUB Norsk Tipping Odds',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        Text(
                          match.odds.home.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        Text(
                          match.odds.draw.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          'Draw',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        Text(
                          match.odds.away.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          'Away',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Expected Value
            const Text(
              'Expected Value per krone',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        match.expectedValue.home.toStringAsFixed(3),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _getEvColor(match.expectedValue.home),
                        ),
                      ),
                      const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        match.expectedValue.draw.toStringAsFixed(3),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _getEvColor(match.expectedValue.draw),
                        ),
                      ),
                      const Text(
                        'Draw',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        match.expectedValue.away.toStringAsFixed(3),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _getEvColor(match.expectedValue.away),
                        ),
                      ),
                      const Text(
                        'Away',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
