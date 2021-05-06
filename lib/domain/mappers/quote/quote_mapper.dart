import 'package:toro_test/domain/entities/entities.dart';

class QuoteMapper {
  static QuoteEntity fromMap(Map<String, dynamic> map) {
    final symbol = map.keys.first;

    return QuoteEntity(
      symbol: symbol,
      value: map[symbol],
      timestamp: map['timestamp'],
    );
  }
}
