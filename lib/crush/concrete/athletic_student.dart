import 'dart:async';

import 'package:stock_observer_pattern/crush/base/student_badge.dart';
import 'package:stock_observer_pattern/crush/base/student_ticker.dart';

class AthleticStudentTicket extends StudentTicker{
  AthleticStudentTicket(){
    title = StudentBadge.SPORT.name;
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setStock(StudentBadge.SPORT);
        notifyToSubscribers();
    });
  }
}