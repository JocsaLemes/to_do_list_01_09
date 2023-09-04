import 'package:flutter/material.dart';
import 'package:to_do_list_01_09/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retirar o banner debug
      title: 'Lista de tarefas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 77, 255, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Minhas Tarefas'),
    );
  }
}
