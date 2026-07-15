import 'package:flutter/material.dart';

class AppTheme extends StatelessWidget {
  final Function(bool) changeTheme;
  const AppTheme({super.key, required this.changeTheme});

  @override
  Widget build(BuildContext context) {
    final isbright = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      onPressed: () => changeTheme(isbright), 
      icon: isbright 
        ? const Icon(Icons.dark_mode) 
        : const Icon(Icons.light_mode));
  }
}