

import '../base/stock.dart';
import '../base/stock_subscriber.dart';

class DefaultStockSubscriber extends StockSubscriber{
  @override
  // TODO: implement title
  String get title => "DefaultStockSubscriber";
  @override
  void update(Stock stock) {
    stockStreamController.add(stock);
  }
  
}