import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_final_eraasoft/api/endpoints.dart';
import 'package:todo_app_final_eraasoft/models/task_model.dart';

import '../screens/update_or_delete_tasks_screen.dart';


class TaskWidget extends StatelessWidget {

  TaskWidget({@required this.task, Key? key}) : super(key: key);

  Data? task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return UpdateTasksScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey[800]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task?.title ?? '',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              task?.description ?? '',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.blueGrey[700]
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Starts At ${DateFormat("hh:mm").format(DateTime.parse(task!.createdAt!))}",
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.blueGrey[700]
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer_off_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Ends At ${DateFormat("hh:mm").format(DateTime.parse(task!.endDate!))}" ,
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}