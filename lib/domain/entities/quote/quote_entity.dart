import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String symbol;
  final double value;
  final int timestamp;

  QuoteEntity({
    required this.symbol,
    required this.value,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
        this.symbol,
        this.value,
        this.timestamp,
      ];
}
