import 'package:toro_test/domain/entities/entities.dart';

abstract class QuoteRepository {
  Stream<QuoteEntity> get quoteStream;

  void dispose();
}
