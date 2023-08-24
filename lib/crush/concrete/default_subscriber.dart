import 'package:stock_observer_pattern/crush/base/student.dart';
import 'package:stock_observer_pattern/crush/base/student_subscriber.dart';

class DefaultSubscriber extends StudentSubscriber{
  @override
  void update(Student student) {
    studentStreamController.add(student);
  }
  
}