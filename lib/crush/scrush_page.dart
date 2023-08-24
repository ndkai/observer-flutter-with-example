import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_observer_pattern/crush/base/student_subscriber.dart';
import 'package:stock_observer_pattern/crush/base/student_ticker.dart';
import 'package:stock_observer_pattern/crush/concrete/athletic_student.dart';
import 'package:stock_observer_pattern/crush/concrete/default_subscriber.dart';
import 'package:stock_observer_pattern/crush/concrete/genius_student.dart';
import 'package:stock_observer_pattern/crush/concrete/growing_subscriber.dart';
import 'package:stock_observer_pattern/crush/concrete/hotboy_student.dart';

import 'base/student.dart';

class CrushPage extends StatefulWidget {
  const CrushPage({super.key});

  @override
  State<CrushPage> createState() => _CrushPageState();
}

class _CrushPageState extends State<CrushPage> {
  final _subscribers = <StudentSubscriber>[
    DefaultSubscriber(),
    GrowingSubscriber()
  ];

  final _studentTicker = <StudentTicker>[
    GeniusStudentTicket(),
    AthleticStudentTicket(),
    HotBotStudentTicket()
  ];

  final _studentEntries = <Student>[];
  StreamSubscription<Student>? _studentStreamSubscription;
  final StudentSubscriber _subscriber = DefaultSubscriber();

  @override
  void initState() {

    super.initState();
    _studentStreamSubscription =
        _subscriber.studentStream.listen(_listenChange);
  }

  void _listenChange(Student student) {
    print("_listenChange");
    setState(() {
      _studentEntries.add(student);
    });
  }

  void _onToggleSubscribers(int index) {
    final studentTicker = _studentTicker[index];
    print("_onToggleSubscribers ${studentTicker.subscribed}");
    if (studentTicker.subscribed) {
      studentTicker.subscribed = !studentTicker.subscribed;
      studentTicker.addSubscriber(_subscriber);
    } else {
      studentTicker.subscribed = !studentTicker.subscribed;
      studentTicker.removeSubscriber(_subscriber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
                children: _items()
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  itemBuilder: (context, index){
                return Text(_studentEntries[index].badge.name);
              }, itemCount:  _studentEntries.length,),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _items(){
    List<Widget> items = <Widget>[];
    for(int i = 0; i < _studentTicker.length; i++){
      items.add(InkWell(
        onTap: () {
          _onToggleSubscribers(i);
        },
        child: Container(
          color: Colors.teal,
          width: MediaQuery.of(context).size.width / 3,
          height: 50,
          child: Center(
            child: Text(_studentTicker[i].title),
          ),
        ),
      ));
    }
    return items;
  }
}
