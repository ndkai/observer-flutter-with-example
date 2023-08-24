

import '../base/stock.dart';
import '../base/stock_change_direction.dart';
import '../base/stock_subscriber.dart';

class GrowingStockSubscriber extends StockSubscriber{
  @override
  // TODO: implement title
  String get title => "GrowingStockSubscriber";
  @override
  void update(Stock stock) {
    if(stock.direction == StockChangeDirection.growing){
      stockStreamController.add(stock);
    }
  }
  
}