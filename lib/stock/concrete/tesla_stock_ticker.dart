import 'dart:async';

import '../base/stock_ticker_symbol.dart';
import '../base/stock_ticket.dart';
final class TeslaStockTicker extends StockTicket {
  TeslaStockTicker() {
    title = StockTicketSymbol.TSLA.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 3),
          (_) {
        setStock(StockTicketSymbol.TSLA, 60000, 65000);
        notifySubscribers();
      },
    );
  }
}