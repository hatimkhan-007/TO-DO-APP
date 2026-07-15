import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/task_provider.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const TodoAPP(),
      )
    );
}

class TodoAPP extends StatelessWidget {
  const TodoAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO-DO APP',
      home: HomeScreen(),
    );
  }
}