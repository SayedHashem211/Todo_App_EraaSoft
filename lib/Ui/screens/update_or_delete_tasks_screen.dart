import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_final_eraasoft/tasks_bloc/tasks_cubit.dart';

import '../../models/task_model.dart';

class UpdateTasksScreen extends StatefulWidget {
  const UpdateTasksScreen({Key? key}) : super(key: key);

  @override
  State<UpdateTasksScreen> createState() => _UpdateTasksScreenState();
}

class _UpdateTasksScreenState extends State<UpdateTasksScreen> {
  Data? task;

  var formKey = GlobalKey<FormState>();

  var idController = TextEditingController();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var startDateController = TextEditingController();
  var startDateTimeController = TextEditingController();
  var endDateController = TextEditingController();
  var endDateTimeController = TextEditingController();
  var statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Update Task",
          style: TextStyle(
              fontSize: 30, color: Colors.white70, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, Enter title';
                      }
                      return null;
                    },
                    controller: idController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[800],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "id",
                      hintStyle: const TextStyle(color: Colors.white54),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, Enter title';
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[800],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "title",
                      hintStyle: const TextStyle(color: Colors.white54),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, Enter description';
                      }
                      return null;
                    },
                    controller: descriptionController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[800],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "description",
                      hintStyle: const TextStyle(color: Colors.white54),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Start Date",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            ).then((value) {
                              startDateController.text =
                                  DateFormat('yyyy/MM/dd').format(value!);
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, Enter start date';
                            }
                            return null;
                          },
                          controller: startDateController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[800],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Initial Date",
                            hintStyle: const TextStyle(color: Colors.white54),
                            // fillColor: Colors.blueGrey,
                            // focusColor: Colors.white38,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              startDateTimeController.text =
                                  "${value?.hour}:${value?.minute}";
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, Enter start time';
                            }
                            return null;
                          },
                          controller: startDateTimeController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[800],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Initial Time",
                            hintStyle: const TextStyle(color: Colors.white54),
                            // fillColor: Colors.blueGrey,
                            // focusColor: Colors.white38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text("End Date",
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            ).then((value) {
                              // endDate.text = DateFormat.yMMMd().format(DateTime.parse(value.toString()));
                              endDateController.text =
                                  DateFormat('yyyy/MM/dd').format(value!);
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, Enter end date';
                            }
                            return null;
                          },
                          controller: endDateController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[800],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "End Date",
                            hintStyle: const TextStyle(color: Colors.white54),
                            // fillColor: Colors.blueGrey,
                            // focusColor: Colors.white38,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              endDateTimeController.text =
                                  "${value?.hour}:${value?.minute}";
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, Enter end time';
                            }
                            return null;
                          },
                          controller: endDateTimeController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[800],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "End Time",
                            hintStyle: const TextStyle(color: Colors.white54),
                            // fillColor: Colors.blueGrey,
                            // focusColor: Colors.white38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, Enter id';
                      }
                      return null;
                    },
                    controller: statusController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[800],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "status",
                      hintStyle: const TextStyle(color: Colors.white54),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // logic
                            TasksCubit.get(context).updateTask(
                                id: int.parse(idController.text),
                                title: titleController.text,
                                description: descriptionController.text,
                                startDate: startDateController.text,
                                endDate: endDateController.text,
                                status: statusController.text);
                            TasksCubit.get(context)
                                .deleteTask(id: int.parse(idController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Task Updated Successfully"),
                                    backgroundColor: Colors.teal,
                                    duration: Duration(seconds: 3)));
                            Navigator.pop(context);
                          },
                          style: const ButtonStyle(
                            animationDuration: Duration(seconds: 5),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // delete logic
                            TasksCubit.get(context)
                                .deleteTask(id: int.parse(idController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Task Deleted Successfully"),
                                    backgroundColor: Colors.teal,
                                    duration: Duration(seconds: 3)));
                            Navigator.pop(context);
                          },
                          style: const ButtonStyle(
                            animationDuration: Duration(seconds: 5),
                          ),
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
