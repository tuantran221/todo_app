import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;
  final onEditItem;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
    required this.onEditItem(),
  }) : super(key: key);

  @override
  Widget build(context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        onTap: () {
          onTodoChanged(todo);
        },
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: theme.colorScheme.primary, // Use the primary color from the theme
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          todo.date,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                onEditItem();
                print('click edit');
              },
              icon: Icon(Icons.edit),
              color: theme.iconTheme.color, // Use the iconTheme color from the theme
            ),
            IconButton(
              onPressed: () {
                onDeleteItem(todo.id);
                print('click delete');
              },
              icon: Icon(Icons.delete),
              color: theme.iconTheme.color, // Use the iconTheme color from the theme
            ),
          ],
        ),
      ),
    );
  }
}
