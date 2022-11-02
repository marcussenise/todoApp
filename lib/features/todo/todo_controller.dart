  import 'package:intl/intl.dart';
import 'package:todo/features/todo/todo_model.dart';
import 'package:todo/repository/app_repository.dart';
class TodoController{

  String formatDate(){
    DateTime now = DateTime.now();
    return DateFormat('d MMM, yyyy HH:mm').format(now);
  }

  postTodoModel(TodoModel todo){
    AppRepository().postTodo(todo);
  }


}