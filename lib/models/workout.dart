import 'package:isar/isar.dart';
import 'package:simpleset_app/models/exercise.dart';

part 'workout.g.dart';

@collection
class Workout {
  Id id = Isar.autoIncrement;

  String name;

  @Index()
  late DateTime dateTime;

  Workout({required this.name}) : dateTime = DateTime.now();

  final exercises = IsarLinks<Exercise>();
}
