import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskTile,
    required this.onTap,
    required this.onDelete,
  });

  final Task taskTile;
  final VoidCallback onTap;
  final VoidCallback onDelete;

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
              onTap: onTap,
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
                  color:
                      taskTile.isCompleted
                          ? Colors.green
                          : Colors.white,
                  border:
                      Border.all(
                    color:
                        Colors.green,
                    width: 3,
                  ),
                ),
                child:
                    taskTile.isCompleted
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
                    taskTile.label,
                    style:
                        TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight
                              .bold,
                      decoration:
                          taskTile
                                  .isCompleted
                              ? TextDecoration
                                  .lineThrough
                              : null,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    "${taskTile.dateTime.day}/"
                    "${taskTile.dateTime.month}/"
                    "${taskTile.dateTime.year}",
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
              onPressed: onDelete,
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