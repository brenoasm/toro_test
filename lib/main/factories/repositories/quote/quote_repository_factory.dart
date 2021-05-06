import 'package:toro_test/domain/repositories/repositories.dart';
import 'package:toro_test/infra/repositorories/repositories.dart';
import 'package:web_socket_channel/io.dart';

QuoteRepository makeQuoteRepository() => QuoteRepositoryImpl(
      webSocketChannel:
          IOWebSocketChannel.connect('wss://localhost:8080/quotes'),
    );
