import 'dart:async';
import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toro_test/domain/entities/quote/quote_entity.dart';
import 'package:toro_test/infra/repositorories/repositories.dart';
import 'package:web_socket_channel/io.dart';

import 'package:toro_test/domain/repositories/repositories.dart';

class IOWebSocketChannelSpy extends Mock implements IOWebSocketChannel {}

void main() {
  test('should correctly map json to QuoteEntity', () async {
    IOWebSocketChannel webSocketChannel = IOWebSocketChannelSpy();
    QuoteRepository sut = QuoteRepositoryImpl(
      webSocketChannel: webSocketChannel,
    );

    QuoteEntity quote = QuoteEntity(
      symbol: faker.lorem.word(),
      value: faker.randomGenerator.decimal(),
      timestamp: faker.date.dateTime().millisecondsSinceEpoch,
    );

    final map = {
      quote.symbol: quote.value,
      'timestamp': quote.timestamp,
    };

    when(() => webSocketChannel.stream).thenAnswer(
      (invocation) => Stream.value(
        jsonEncode(map),
      ),
    );

    expectLater(
      sut.quoteStream,
      emits(quote),
    );
  });
}
