import 'package:flutter/material.dart';
import 'package:todo/features/todo/todo_model.dart';
import 'package:todo/repository/app_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TarefApp'),
      ),
      body: Center(
        child: FutureBuilder<List<TodoModel>>(
          future: AppRepository().getAll(),
          builder: (context, snapshot){
            if(snapshot.data == null && !snapshot.hasError){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError){
              const Center(
                child: Text('Não há nenhuma tarefa adicionada'),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                final todo = snapshot.data?[index];
                return ListTile(
                  isThreeLine: true,
                  title: Text(todo?.title ?? ''),
                  subtitle: Column(
                    children: [
                      Text("Data: ${todo?.date ?? ''}"),
                      const SizedBox(height: 5,),
                      Text('Categoria: ${todo?.category ?? ''}'),
                      const SizedBox(height: 5,),
                      Text('Descrição: ${todo?.description ?? ''}'),
                    ]
                  ),
                );
              });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/todoPage');
        },
        tooltip: 'Adicionar tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
