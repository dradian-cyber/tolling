import '../../domain/entities/toll.dart';

class TollModel extends Toll {
  TollModel({
    required String id,
    required String location,
    required double amount,
    required DateTime timestamp,
  }) : super(id: id, location: location, amount: amount, timestamp: timestamp);

  factory TollModel.fromJson(Map<String, dynamic> json) {
    return TollModel(
      id: json['id'],
      location: json['location'],
      amount: json['amount'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
