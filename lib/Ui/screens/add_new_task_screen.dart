import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_final_eraasoft/tasks_bloc/tasks_cubit.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  // form validation
  var formKey = GlobalKey<FormState>();

  // controllers
  var title = TextEditingController();
  var description = TextEditingController();
  var startDate = TextEditingController();
  var startDateTime = TextEditingController();
  var endDate = TextEditingController();
  var endDateTime = TextEditingController();

  DateTime? startDateAndTime;
  DateTime? andDateAndTime;

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
          "Add New Task",
          style: TextStyle(
              fontSize: 30, color: Colors.white70, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please, Enter title';
                  }
                  return null;
                },
                controller: title,
                decoration: InputDecoration(
                  fillColor: Colors.grey[800],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter a new title",
                  hintStyle: const TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please, Enter description';
                  }
                  return null;
                },
                controller: description,
                decoration: InputDecoration(
                  fillColor: Colors.grey[800],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter a description",
                  hintStyle: const TextStyle(color: Colors.white54),
                  // fillColor: Colors.blueGrey,
                  // focusColor: Colors.white38,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text("Start Date", style: TextStyle(color: Colors.white54,fontSize: 20,fontWeight: FontWeight.bold)),
              const SizedBox(height: 20,),
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
                          // startDate.text = DateFormat.yMMMd().format(DateTime.parse(value.toString()));
                        startDate.text = DateFormat('yyyy/MM/dd').format(value!);
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter start date';
                        }
                        return null;
                      },
                      controller: startDate,
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
                          startDateTime.text = "${value?.hour}:${value?.minute}";
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter start time';
                        }
                        return null;
                      },
                      controller: startDateTime,
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
              const Text("End Date", style: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold,fontSize: 20)),
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
                          endDate.text = DateFormat('yyyy/MM/dd').format(value!);
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter end date';
                        }
                        return null;
                      },
                      controller: endDate,
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
                          endDateTime.text = "${value?.hour}:${value?.minute}";
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter end time';
                        }
                        return null;
                      },
                      controller: endDateTime,
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
                height: 45,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // logic
                    TasksCubit.get(context).addNewTask(title: title.text, description: description.text, startDate: '${startDate.text} ', endDate: '${endDate.text}').then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Add New Task",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  style: const ButtonStyle(
                    animationDuration: Duration(seconds: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
