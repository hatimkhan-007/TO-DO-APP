import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.taskTile,
  });

  final Task taskTile;

  @override
  State<TaskTile> createState() =>
      _TaskTileState();
}

class _TaskTileState
    extends State<TaskTile> {

  bool _isFilled = false;

  void _toggleFill() {
    setState(() {
      _isFilled = !_isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15),
      ),

      child: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Row(
          children: [

            GestureDetector(
              onTap: _toggleFill,

              child: AnimatedContainer(
                duration:
                    const Duration(
                  milliseconds: 300,
                ),

                width: 30,
                height: 30,

                decoration:
                    BoxDecoration(
                  shape:
                      BoxShape.circle,

                  color: _isFilled
                      ? Colors.green
                      : Colors.white,

                  border:
                      Border.all(
                    color:
                        Colors.green,
                    width: 3,
                  ),
                ),

                child: _isFilled
                    ? const Icon(
                        Icons.check,
                        color:
                            Colors.white,
                        size: 18,
                      )
                    : null,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  Text(
                    widget.taskTile.label,
                    style:
                        const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    "${widget.taskTile.dateTime.day}/"
                    "${widget.taskTile.dateTime.month}/"
                    "${widget.taskTile.dateTime.year}",

                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},

              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}