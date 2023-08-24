import 'stock_change_direction.dart';
import 'stock_ticker_symbol.dart';

class Stock{
   StockTicketSymbol symbol;
   StockChangeDirection direction;
   double price;
   double changeAmount;

  Stock({required this.symbol, required this.direction, required this.price, required this.changeAmount});
}