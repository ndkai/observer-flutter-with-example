import 'package:flutter/material.dart';

import '../base/stock.dart';
import '../base/stock_change_direction.dart';


class StockRow extends StatelessWidget {
  const StockRow({
    required this.stock,
  });

  final Stock stock;

  Color get color => stock.direction == StockChangeDirection.growing
      ? Colors.green
      : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            stock.symbol.name,
            style: TextStyle(color: color),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            stock.price.toString(),
            style: TextStyle(color: color),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Icon(
            stock.direction == StockChangeDirection.growing
                ? Icons.arrow_upward
                : Icons.arrow_downward,
            color: color,
          ),
        ),
        Text(
          stock.changeAmount.toStringAsFixed(2),
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}