import 'package:flutter/material.dart';
import 'package:flutter_application_1/comps/todo-scaffold/todo_scaffold.dart';
import 'package:flutter_application_1/screens/bodies/about_me_body.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoScaffold(body: const AboutMeBody());
  }
}
