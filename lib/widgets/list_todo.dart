import "package:flutter/material.dart";
import 'package:flutter_app_node/models/user_model.dart';
import 'package:flutter_app_node/providers/user_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ListTodoTile extends StatefulWidget {
  final String title;
  final String user;
  final VoidCallback update;
  final Function delete;
  const ListTodoTile({
    Key? key,
    required this.title,
    required this.user,
    required this.update,
    required this.delete,
  }) : super(key: key);

  @override
  State<ListTodoTile> createState() => _ListTodoTileState();
}

class _ListTodoTileState extends State<ListTodoTile> {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).user;
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.update();
              },
              icon: Icons.edit,
              backgroundColor: Colors.blue,
            ),
            SlidableAction(
              onPressed: (context) {
                widget.delete();
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.green),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.role == 'admin'
                    ? "${widget.user}: ${widget.title}"
                    : widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Roboto",
                  letterSpacing: 0.4,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
