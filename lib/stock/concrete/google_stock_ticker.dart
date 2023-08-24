import 'dart:async';

import '../base/stock_ticker_symbol.dart';
import '../base/stock_ticket.dart';

final class GoogleStockTicker extends StockTicket {
  GoogleStockTicker() {
    title = StockTicketSymbol.GOOGL.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 5),
          (_) {
        setStock(StockTicketSymbol.GOOGL, 200000, 204000);
        notifySubscribers();
      },
    );
  }
}