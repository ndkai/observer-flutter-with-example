import 'package:flutter/material.dart';

import '../base/stock_subscriber.dart';


class StockSubscriberSelection extends StatelessWidget {
  final List<StockSubscriber> stockSubscriberList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const StockSubscriberSelection({
    required this.stockSubscriberList,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items()
    );
  }

  List<Widget> _items(){
    List<Widget> items = <Widget>[];
    for (var i = 0; i < stockSubscriberList.length; i++) {
      items.add(RadioListTile(
        title: Text(stockSubscriberList[i].title),
        value: i,
        groupValue: selectedIndex,
        selected: i == selectedIndex,
        activeColor: Colors.black,
        onChanged: onChanged,
      ));
    }
    return items;
  }
}