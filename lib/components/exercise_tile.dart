import 'package:flutter/material.dart';
import 'package:simpleset_app/models/exercise.dart';

import 'exerciseset_tile.dart';

class ExerciseTile extends StatefulWidget {
  final Exercise exercise;
  final int index;

  const ExerciseTile({super.key, required this.exercise, required this.index});

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 40),
                    child: Text(
                      '${widget.index + 1}.   ${widget.exercise.name}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.more_vert_rounded),
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Set #'),
                      //const SizedBox(width: 50),
                      Text('Weight'),
                      //const SizedBox(width: 50),
                      Text('Reps')
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.exercise.sets.length,
                itemBuilder: (context, index) => ExerciseSetTile(
                  setListLength: widget.exercise.sets.length,
                  myIndex: index,
                  mySet: widget.exercise.sets[index],
                  roundTop: false,
                ),
              ),
            ],
          )),
    );
  }
}
