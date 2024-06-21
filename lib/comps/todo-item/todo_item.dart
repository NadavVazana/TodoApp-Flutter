import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Todo {
  bool isDone;
  String text;

  Todo({required this.isDone, required this.text});
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  final Function(bool?)? onChange;
  final Function? onDelete;
  final Function? onEdit;

  TodoItem(
      {Key? key, this.onEdit, this.onDelete, this.onChange, required this.todo})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(value: widget.todo.isDone, onChanged: widget.onChange),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.onChange?.call(!widget.todo.isDone);
                    });
                  },
                  child: Text(
                    widget.todo.text,
                    style: TextStyle(
                        fontSize: 19,
                        decoration: widget.todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      widget.onDelete?.call();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                    ),
                  )),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  widget.onEdit?.call();
                },
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Icon(
                    Icons.edit,
                    size: 22,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
