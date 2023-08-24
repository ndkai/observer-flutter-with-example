import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:stock_observer_pattern/crush/base/follow_direction.dart';
import 'package:stock_observer_pattern/crush/base/student.dart';
import 'package:stock_observer_pattern/crush/base/student_badge.dart';
import 'package:stock_observer_pattern/crush/base/student_subscriber.dart';

class StudentTicker {
  late String title;
  late final Timer timer;
  bool subscribed = true;

  @protected
  Student? student;

  final subscribers = <StudentSubscriber>[];

  void addSubscriber(StudentSubscriber subscriber) {
    subscribers.add(subscriber);
  }

  void removeSubscriber(StudentSubscriber subscriber) {
    subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  void setStock(StudentBadge studentBadge) {
    final lastStudent = student;
    final follower = Random().nextInt(1000);
    int changeAmount = lastStudent == null ? 0 : lastStudent.follower - follower;
    student = Student(badge: studentBadge,
        followDirection: follower > 500
            ? FollowDirection.GROWING
            : FollowDirection.FAILING,
        follower: follower,
        changeAmount: changeAmount);
  }

  void notifyToSubscribers() {
    print("notifyToSubscribers");
    for (var subscriber in subscribers) {
      subscriber.update(student!);
    }
  }

  void toggleSubscriber() {
    subscribed = !subscribed;
  }


}