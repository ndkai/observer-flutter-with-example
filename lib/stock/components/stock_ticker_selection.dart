import 'package:flutter/material.dart';

import '../base/stock_ticket.dart';

class StockTickerSelection extends StatelessWidget {
  final List<StockTicket> stockTickers;
  final ValueChanged<int> onChanged;

  const StockTickerSelection({
    required this.stockTickers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var i = 0; i < stockTickers.length; i++)
          Expanded(
            child: _TickerTile(
              stockTickerModel: stockTickers[i],
              index: i,
              onChanged: onChanged,
            ),
          )
      ],
    );
  }
}

class _TickerTile extends StatelessWidget {
  final StockTicket stockTickerModel;
  final int index;
  final ValueChanged<int> onChanged;

  const _TickerTile({
    required this.stockTickerModel,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: stockTickerModel.subscribed ? Colors.black : Colors.white,
      child: InkWell(
        onTap: () => onChanged(index),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            stockTickerModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: stockTickerModel.subscribed ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}