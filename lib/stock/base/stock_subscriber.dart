import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'stock.dart';

abstract class StockSubscriber {
   @protected
   late String title;
   String id = Random().nextInt(200000).toString();

   @protected
   final StreamController<Stock> stockStreamController = StreamController.broadcast();

   Stream<Stock> get stockStream => stockStreamController.stream;
  void update(Stock stock);
}