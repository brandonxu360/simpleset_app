import 'package:isar/isar.dart';
import 'package:simpleset_app/models/exerciseset.dart';

part 'exercise.g.dart';

@collection
class Exercise {
  Id id = Isar.autoIncrement;

  @Index()
  String name;

  int order;

  final exerciseSets = IsarLinks<ExerciseSet>();

  Exercise({required this.name, required this.order});
}
