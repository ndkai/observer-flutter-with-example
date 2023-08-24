import 'dart:async';

import '../base/stock_ticker_symbol.dart';
import '../base/stock_ticket.dart';


final class GameStopStockTicker extends StockTicket {
  GameStopStockTicker() {
    title = StockTicketSymbol.GME.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
          (_) {
        setStock(StockTicketSymbol.GME, 16000, 22000);
        notifySubscribers();
      },
    );
  }
}