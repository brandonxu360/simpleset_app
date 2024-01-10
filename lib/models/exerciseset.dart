import 'package:isar/isar.dart';

part 'exerciseset.g.dart';

@collection
class ExerciseSet {
  Id id = Isar.autoIncrement;

  int order;

  double weight;

  int reps;

  ExerciseSet({required this.order, required this.weight, required this.reps});
}
