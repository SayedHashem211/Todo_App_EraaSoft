import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_final_eraasoft/tasks_bloc/tasks_cubit.dart';

import '../../models/task_model.dart';
import '../widgets/task_widget.dart';
import 'add_new_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TaskModel? Task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<TasksCubit>(context)..getAllTasks(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            "Tasks Screen",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        // body:TaskWidget(task: TaskModel()),
        body: SafeArea(
          child: BlocConsumer<TasksCubit, TasksState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  var cubit = TasksCubit.get(context);
                  return cubit.newTaskModel == null
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : TaskWidget(
                          task: cubit.newTaskModel?.response?.data?[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 8,
                // Task?.response?.data?.length ?? 0,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[700],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const NewTaskScreen();
              }),
            );
          },
          focusColor: Colors.black12,
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
