/// This file defines the Toll class, which represents a toll entity with
/// properties for id, location, amount, and timestamp.
class Toll {
  final String id;
  final String location;
  final double amount;
  final DateTime timestamp;

  Toll({required this.id, required this.location, required this.amount, required this.timestamp});
}
