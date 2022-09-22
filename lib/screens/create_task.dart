import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _newTask = '';

    return Container(
      color: const Color(0xff757575),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (String text) {
                        _newTask = text;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        taskData.addTask(Task(title: _newTask));
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                      ),
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
