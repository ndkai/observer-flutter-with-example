import 'dart:async';

import 'package:stock_observer_pattern/crush/base/student_badge.dart';
import 'package:stock_observer_pattern/crush/base/student_ticker.dart';

class GeniusStudentTicket extends StudentTicker{
  GeniusStudentTicket(){
    title = StudentBadge.STUDY.name;
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setStock(StudentBadge.STUDY);
        notifyToSubscribers();
    });
  }
}