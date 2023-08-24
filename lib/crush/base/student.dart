import 'package:stock_observer_pattern/crush/base/follow_direction.dart';
import 'package:stock_observer_pattern/crush/base/student_badge.dart';

class Student{
  StudentBadge badge;
  FollowDirection followDirection;
  int follower;
  int changeAmount;

  Student({required this.badge, required this.followDirection, required this.follower, required this.changeAmount});
}