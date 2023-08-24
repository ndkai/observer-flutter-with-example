import 'package:stock_observer_pattern/crush/base/follow_direction.dart';
import 'package:stock_observer_pattern/crush/base/student.dart';
import 'package:stock_observer_pattern/crush/base/student_subscriber.dart';

class GrowingSubscriber extends StudentSubscriber{
  @override
  void update(Student student) {
    if(student.followDirection == FollowDirection.GROWING){
      studentStreamController.add(student);
    }

  }
  
}