import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'stock.dart';
import 'stock_change_direction.dart';
import 'stock_subscriber.dart';
import 'stock_ticker_symbol.dart';

base class StockTicket {
  late final String title;
  late final Timer stockTimer;
  bool subscribed = false;

  @protected
  Stock? stock;

  final _subscribers = <StockSubscriber>[];

  void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);

  void unsubscribe(StockSubscriber subscriber) => _subscribers.removeWhere((element) => element.id == subscriber.id);

  void notifySubscribers() {
    print("${title}: notifySubscribers ${_subscribers.length}");
    for (final subscriber in _subscribers) {
      subscriber.update(stock!);
    }
  }

  void toggleSubscribed() {
    subscribed = !subscribed;
  }

  void setStock(StockTicketSymbol stockTicketSymbol, int min, int max) {
    final lastStock = stock;
    final price = Random().nextDouble();
    final changeAmount = lastStock != null ? price - lastStock.price : 0.0;
    stock = Stock(symbol: stockTicketSymbol,
        direction: changeAmount > 0
            ? StockChangeDirection.growing
            : StockChangeDirection.failing,
        price: price,
        changeAmount: changeAmount);
  }

  void stopTimer() => stockTimer.cancel();
}

