import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_final_eraasoft/api/dio_helper.dart';
import 'package:todo_app_final_eraasoft/api/endpoints.dart';
import 'package:todo_app_final_eraasoft/models/task_model.dart';

import '../constants.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  TaskModel? newTaskModel;
  Data? newTask;

  // function to make me dont repeat BlocProvider.f(context) to access cubit attributes and functions.
  static TasksCubit get(context) {
    return BlocProvider.of<TasksCubit>(context);
  }

  // get All Tasks func

  Future getAllTasks() async {
    emit(getAllTasksLoadingState());
    await DioHelper.getData(endPoint: getAllTasksEndpoint, token: token)
        .then((value) {
      print(value.data); // just check
      newTaskModel = TaskModel.fromJson(value.data);
      emit(getAllTasksSuccessState());
    }).catchError((error) {
      print("error from getAllTasks function => ${error.response.data}");
      emit(getAllTasksErrorState());
    });
  }

  // add new task func
  Future<void> addNewTask(
      {required String title,
      required String description,
      required String startDate,
      required String endDate}) async {
    emit(addNewTaskLoadingState());
    await DioHelper.postData(
            endPoint: getAllTasksEndpoint,
            data: {
              'title': title,
              'description': description,
              'start_date': startDate,
              'end_date': endDate
            },
            token: token)
        .then((value) {
      print(value.data);
      newTask = Data.fromJson(value.data['response']);
      newTaskModel?.response?.data?.add(newTask!);
      emit(addNewTaskSuccessState());
    }).catchError((error) {
      print(error.response?.data);
      emit(addNewTaskErrorState());
    });
  }

  // update task func

  Future<void> updateTask(
      {required int id,
      required String title,
      required String description,
      required String startDate,
      required String endDate,
      required String status}) async {
    emit(updateTaskLoadingState());
    await DioHelper.putData(
            endPoint: "$getAllTasksEndpoint/$id",
            data: {
              "id": id,
              "title": title,
              "description": description,
              "start_date": startDate,
              "end_date": endDate,
              "status": status,
              "_method": 'PUT',
            },
            token: token)
        .then((value) {
      print(value.data);
      emit(updateTaskSuccessState());
    }).catchError((error) {
      print(error.response?.data);
      emit(updateTaskErrorState());
    });
  }

//  delete task func

  Future<void> deleteTask({required int id}) async {
    emit(deleteTaskLoadingState());
    await DioHelper.deleteData(
            endPoint: "$getAllTasksEndpoint/$id", token: token)
        .then((value) {
      print(value.data);
      emit(deleteTaskSuccessState());
    }).catchError((error) {
      print(error.response?.data);
      emit(deleteTaskErrorState());
    });
  }
}
