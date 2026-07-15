import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const TodoApp(),
    ),
  );
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() =>
      _TodoAppState();
}

class _TodoAppState
    extends State<TodoApp> {

  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode =
          isDark
              ? ThemeMode.dark
              : ThemeMode.light;
    });
  }

  @override
  Widget build(
      BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false,

      title: 'ToDo App',

      theme: ThemeData(
        useMaterial3: true, 
        brightness: Brightness.light,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      themeMode: _themeMode,

      home: HomeScreen(
        changeTheme:
            changeTheme,
      ),
    );
  }
}