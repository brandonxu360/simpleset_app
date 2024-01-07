import 'package:isar/isar.dart';

part 'exerciseset.g.dart';

@collection
class ExerciseSet {
  Id id = Isar.autoIncrement;

  int order;

  ExerciseSet({required this.order});
}
