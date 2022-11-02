import 'package:flutter/material.dart';
import 'package:todo/features/todo/todo_controller.dart';
import 'package:todo/features/todo/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  static const _categories = [
    "Casa",
    "Trabalho",
    "Estudos",
    "Hobbie",
    "Outros"
  ];
  
  String dropdownValue = _categories.first;

    @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar tarefa'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    labelText: 'Título',
                  ),
                ),
                const SizedBox(height: 10,),
                FormField<String>(
                  builder: (FormFieldState<String> state){
                    return DropdownButton<String>(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward_rounded),
                      items: _categories.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropdownValue = value!;
                        });
                      }
                      );
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'Criar uma nota',
                  ),   
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {
                    final todo = TodoModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      category: dropdownValue
                    );
                    await TodoController().postTodoModel(todo);
                    if(!mounted) return;
                    Navigator.pushNamedAndRemoveUntil(context, ('/'), (route) => false);
                  },
                  child: const Text('Enviar')),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}