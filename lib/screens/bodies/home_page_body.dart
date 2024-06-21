import 'package:flutter/material.dart';
import '../../comps/todo-item/todo_item.dart';
import '../../comps/edit-dialog/edit_dialog.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late String inputValue;
  List<Todo> todoList = [Todo(isDone: true, text: 'First todo')];

  void onAddTodo() {
    setState(() {
      todoList.insert(0, Todo(isDone: false, text: inputValue));
      _textEditingController.clear();
    });
  }

  void onTodoChange(bool? value, int? index) {
    if (index != null && value != null) {
      setState(() {
        todoList[index].isDone = value;
      });
    }
  }

  void onTodoDelete(int index) {
    setState(() {
      todoList.remove(todoList[index]);
    });
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  void onTodoEdit(int index) {
    showDialog(
        context: context,
        builder: (context) => EditDialog(
              initValue: todoList[index].text,
              onCancel: () {
                closeDialog();
              },
              onConfirm: (String? value) {
                if (value != null) {
                  setState(() {
                    todoList[index].text = value;
                    closeDialog();
                  });
                }
              },
            ));
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
                onSubmitted: (String? value) {
                  onAddTodo;
                },
                controller: _textEditingController,
                onChanged: (String value) {
                  setState(() {
                    inputValue = value;
                  });
                },
                decoration:
                    const InputDecoration(label: Text('Write a TODO...'))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent),
                onPressed: onAddTodo,
                child: const Text(
                  'Add TODO',
                  style: TextStyle(color: Colors.black),
                )),
            const SizedBox(height: 20),
            for (var index = 0; index < todoList.length; index++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TodoItem(
                  todo: todoList[index],
                  onChange: (bool? value) {
                    onTodoChange(value, index);
                  },
                  onDelete: () {
                    onTodoDelete(index);
                  },
                  onEdit: () {
                    onTodoEdit(index);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
