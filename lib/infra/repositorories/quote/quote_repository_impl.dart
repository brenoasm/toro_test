import 'dart:convert';

import 'package:toro_test/domain/entities/entities.dart';
import 'package:toro_test/domain/mappers/mappers.dart';
import 'package:toro_test/domain/repositories/repositories.dart';

import 'package:web_socket_channel/io.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final IOWebSocketChannel webSocketChannel;

  QuoteRepositoryImpl({required this.webSocketChannel});

  @override
  void dispose() {
    webSocketChannel.sink.close();
  }

  @override
  Stream<QuoteEntity> get quoteStream {
    return webSocketChannel.stream.map<QuoteEntity>((event) {
      final map = jsonDecode(event);
      final quote = QuoteMapper.fromMap(map);

      return quote;
    });
  }
}
