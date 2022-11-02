import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:todo/features/todo/todo_model.dart';

class AppRepository {
  String endpoint = 'https://crudcrud.com/api/9959bd9126574daebe83e34d8e54c07e';
  var dio = Dio();

  Future<Response> postTodo(TodoModel todo) async {
    try {
      Response response = await dio.post('$endpoint/todo',
          data: todo.toJson(),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json"
          }));
      return response;
    } on Exception catch (e) {
      throw Exception("Erro ocorrido: $e");
    }
  }

  Future<List<TodoModel>> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('$endpoint/todo'),
      );
      final list = List.from(jsonDecode(response.body));
      return list.map((e) => TodoModel.fromMap(e)).toList();
    } on Exception catch (e) {
      throw Exception("Erro ocorrido: $e");
    }
  }

  Future<void> deleteTodo(String id) async {
    await dio.delete(
      '$endpoint/todo/$id',
    );
    // return response.statusCode == 200 ? true : false;
    
  }

}
