import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';
import '../themes/app_theme.dart';
import 'task_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) changeTheme;

  const HomeScreen({
    super.key,
    required this.changeTheme,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  final TextEditingController
      searchController =
      TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TO-DO APP',
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        actions: [
          AppTheme(
            changeTheme:
                widget.changeTheme,
          ),
        ],
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddTaskScreen(),
            ),
          );
        },
        child:
            const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(
            20,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              const Text(
                'My Tasks',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:
                      FontWeight.w900,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              Text(
                'Stay organized today',
                style: TextStyle(
                  fontSize: 14,
                  color:
                      Theme.of(
                            context,
                          )
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withOpacity(
                            0.7,
                          ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              TextField(
                controller:
                    searchController,
                decoration:
                    InputDecoration(
                  hintText:
                      'Search tasks...',
                  prefixIcon:
                      const Icon(
                    Icons.search,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Expanded(
                child:
                    Consumer<
                        TaskProvider>(
                  builder: (
                    context,
                    provider,
                    child,
                  ) {
                    if (provider
                        .task
                        .isEmpty) {
                      return const Center(
                        child: Text(
                          'No tasks added yet',
                          style:
                              TextStyle(
                            fontSize:
                                16,
                          ),
                        ),
                      );
                    }

                    return ListView
                        .builder(
                      itemCount:
                          provider
                              .task
                              .length,

                      itemBuilder:
                          (
                        context,
                        index,
                      ) {
                        final task =
                            provider
                                    .task[
                                index];

                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom:
                                12,
                          ),
                          child:
                              TaskTile(
                            taskTile:
                                task,

                            onTap:
                                () {
                              provider
                                  .toggletask(
                                index,
                              );
                            },

                            onDelete:
                                () {
                              provider
                                  .removeTask(
                                index,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}