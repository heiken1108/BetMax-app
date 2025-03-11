import 'package:betmax_app_master/data/models/helper_models.dart';

class MarketModel {
  final String name;
  final SelectionModel selections;
  final SelectionModel probs;
  final SelectionModel expectedValue;

  MarketModel({
    required this.name,
    required this.selections,
    required this.probs,
    required this.expectedValue,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      name: json['name'],
      selections: SelectionModel.fromJson(json['selections']),
      probs: SelectionModel.fromJson(json['probs']),
      expectedValue: SelectionModel.fromJson(json['expected_value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'selections': selections.toJson(),
      'probs': probs.toJson(),
      'expected_value': expectedValue.toJson(),
    };
  }
}
