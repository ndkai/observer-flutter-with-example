import 'dart:async';
import 'dart:math';

import 'package:stock_observer_pattern/crush/base/student.dart';

abstract class StudentSubscriber{
  late String title;
  final int id = Random().nextInt(10000000);

  final StreamController<Student> studentStreamController = StreamController.broadcast();

  Stream<Student> get studentStream => studentStreamController.stream;

  void update(Student student);

}