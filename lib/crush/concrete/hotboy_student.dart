import 'dart:async';

import 'package:stock_observer_pattern/crush/base/student_badge.dart';
import 'package:stock_observer_pattern/crush/base/student_ticker.dart';

class HotBotStudentTicket extends StudentTicker{
  HotBotStudentTicket(){
    title = StudentBadge.GOODLOOKING.name;
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setStock(StudentBadge.GOODLOOKING);
        notifyToSubscribers();
    });
  }
}