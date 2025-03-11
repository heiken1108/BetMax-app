import 'package:betmax_app_master/data/models/helper_models.dart';
import 'package:betmax_app_master/data/models/market_model.dart';
import 'package:flutter/material.dart';

class MarketTile extends StatelessWidget {
  final MarketModel market;

  const MarketTile({
    super.key,
    required this.market,
  });

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
            Text(
              market.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (market.selections is BoolModel)
              BoolSelections(selections: market.selections as BoolModel)
            else if (market.selections is HUBModel)
              HUBSelections(selections: market.selections as HUBModel),
            const SizedBox(height: 12),
            if (market.probs is BoolModel)
              BoolProbs(probs: market.probs as BoolModel)
            else if (market.probs is HUBModel)
              HUBProbs(probs: market.probs as HUBModel),
            const SizedBox(height: 14),
            if (market.expectedValue is BoolModel)
              BoolEVRow(expectedValue: market.expectedValue as BoolModel)
            else if (market.expectedValue is HUBModel)
              HUBEVRow(expectedValue: market.expectedValue as HUBModel),
          ],
        ),
      ),
    );
  }
}

class SelectionBlock extends StatelessWidget {
  final double value;
  final String title;

  SelectionBlock({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              value.toString(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoolSelections extends StatelessWidget {
  final BoolModel selections;

  BoolSelections({
    required this.selections,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SelectionBlock(value: selections.trueOdds, title: 'True'),
        const SizedBox(width: 8),
        SelectionBlock(value: selections.falseOdds, title: 'False'),
      ],
    );
  }
}

class HUBSelections extends StatelessWidget {
  final HUBModel selections;

  HUBSelections({required this.selections});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SelectionBlock(value: selections.home, title: 'Home'),
        const SizedBox(width: 8),
        SelectionBlock(value: selections.draw, title: 'Draw'),
        const SizedBox(width: 8),
        SelectionBlock(value: selections.away, title: 'Away'),
      ],
    );
  }
}

class BoolProbs extends StatelessWidget {
  final BoolModel probs;

  BoolProbs({
    required this.probs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${(probs.trueOdds * 100).toStringAsFixed(1)}%'),
            Text('${(probs.falseOdds * 100).toStringAsFixed(1)}%')
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Row(
            children: [
              Expanded(
                  flex: (probs.trueOdds * 100).toInt(),
                  child: Container(
                    height: 8,
                    color: Colors.green,
                  )),
              Expanded(
                  flex: (probs.falseOdds * 100).toInt(),
                  child: Container(
                    height: 8,
                    color: Colors.red,
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class HUBProbs extends StatelessWidget {
  final HUBModel probs;

  HUBProbs({required this.probs});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${(probs.home * 100).toStringAsFixed(1)}%'),
          Text('${(probs.draw * 100).toStringAsFixed(1)}%'),
          Text('${(probs.away * 100).toStringAsFixed(1)}%')
        ],
      ),
      const SizedBox(height: 8),
      ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Row(
          children: [
            Expanded(
                flex: (probs.home * 100).toInt(),
                child: Container(
                  height: 8,
                  color: Colors.green,
                )),
            Expanded(
                flex: (probs.draw * 100).toInt(),
                child: Container(
                  height: 8,
                  color: Colors.grey,
                )),
            Expanded(
                flex: (probs.away * 100).toInt(),
                child: Container(
                  height: 8,
                  color: Colors.red,
                ))
          ],
        ),
      )
    ]);
  }
}

class EVBlock extends StatelessWidget {
  final double value;
  final String title;

  EVBlock({required this.value, required this.title});

  Color _getEvColor(double value) {
    return value > 1 ? Colors.green.shade600 : Colors.red.shade600;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value.toStringAsFixed(3),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: _getEvColor(value),
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
    );
  }
}

class BoolEVRow extends StatelessWidget {
  final BoolModel expectedValue;

  BoolEVRow({required this.expectedValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EVBlock(value: expectedValue.trueOdds, title: 'True'),
        const SizedBox(width: 8),
        EVBlock(value: expectedValue.falseOdds, title: 'False'),
      ],
    );
  }
}

class HUBEVRow extends StatelessWidget {
  final HUBModel expectedValue;

  HUBEVRow({required this.expectedValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EVBlock(value: expectedValue.home, title: 'Home'),
        const SizedBox(width: 8),
        EVBlock(value: expectedValue.draw, title: 'Draw'),
        const SizedBox(width: 8),
        EVBlock(value: expectedValue.away, title: 'Away'),
      ],
    );
  }
}
