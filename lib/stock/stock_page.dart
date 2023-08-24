import 'dart:async';

import 'package:flutter/material.dart';

import 'base/stock.dart';
import 'base/stock_subscriber.dart';
import 'base/stock_ticket.dart';
import 'components/stock_row.dart';
import 'components/stock_subscriber_selection.dart';
import 'components/stock_ticker_selection.dart';
import 'concrete/default_stock_subcriber.dart';
import 'concrete/gamestop_stock_ticker.dart';
import 'concrete/google_stock_ticker.dart';
import 'concrete/growing_stock_subscriber.dart';
import 'concrete/tesla_stock_ticker.dart';


class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowingStockSubscriber()
  ];
  final _stockTickets = <StockTicket>[
    GameStopStockTicker(),
    GoogleStockTicker(),
    TeslaStockTicker()
  ];

  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;
  StockSubscriber _subscriber = DefaultStockSubscriber();
  var selectedSubscriberIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {
    for (final ticket in _stockTickets) {
      ticket.stopTimer();
    }
    _stockStreamSubscription?.cancel();
    super.dispose();
  }

  void _onStockChange(Stock event){
    print("_onStockChange");
    setState(() {
      _stockEntries.add(event);
    });
  }

  void _setSelectedSubscriberIndex(int? index) {
    for (final ticket in _stockTickets) {
      if (ticket.subscribed) {
        ticket.toggleSubscribed();
        ticket.unsubscribe(_subscriber);
      }
    }
    _stockStreamSubscription?.cancel();
    setState(() {
      _stockEntries.clear();
      selectedSubscriberIndex = index!;
      _subscriber = _stockSubscriberList[selectedSubscriberIndex];
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTicketsSelection(int index) {
    final stockTicket = _stockTickets[index];
    if (stockTicket.subscribed) {
      stockTicket.unsubscribe(_subscriber);
    } else {
      stockTicket.subscribe(_subscriber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              StockSubscriberSelection(
                stockSubscriberList: _stockSubscriberList,
                selectedIndex: selectedSubscriberIndex,
                onChanged: _setSelectedSubscriberIndex,
              ),
              StockTickerSelection(
                stockTickers: _stockTickets,
                onChanged: _toggleStockTicketsSelection,
              ),
              Column(
                children: [
                  for (final stock in _stockEntries.reversed)
                    StockRow(stock: stock)
                ],
              )
            ],
          ),
        ));
  }
}
