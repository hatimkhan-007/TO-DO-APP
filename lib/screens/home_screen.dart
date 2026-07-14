import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController searchController =
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const Text(
                'My Tasks',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Stay organized today',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
                      .withOpacity(0.6),
                ),
              ),

              const SizedBox(height: 30),

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

                  filled: true,
                  fillColor:
                      Colors.grey.shade200,

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius
                            .circular(15),

                    borderSide:
                        BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount:
                      Task.tasks.length,

                  itemBuilder:
                      (context, index) {

                    final task =
                        Task.tasks[index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),

                      // child: TaskTile(
                      //   task: task,
                      // ),
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