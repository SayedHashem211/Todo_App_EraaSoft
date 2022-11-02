part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

// getAllTasks States =>
class getAllTasksLoadingState extends TasksState{}
class getAllTasksSuccessState extends TasksState{}
class getAllTasksErrorState extends TasksState{}

// add new task states =>
class addNewTaskLoadingState extends TasksState{}
class addNewTaskSuccessState extends TasksState{}
class addNewTaskErrorState extends TasksState{}


// update task states =>
class updateTaskLoadingState extends TasksState{}
class updateTaskSuccessState extends TasksState{}
class updateTaskErrorState extends TasksState{}


// delete task states =>
class deleteTaskLoadingState extends TasksState{}
class deleteTaskSuccessState extends TasksState{}
class deleteTaskErrorState extends TasksState{}