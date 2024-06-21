import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bodies/home_page_body.dart';
import 'package:flutter_application_1/comps/todo-scaffold/todo_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return TodoScaffold(body: const HomePageBody());
  }
}
