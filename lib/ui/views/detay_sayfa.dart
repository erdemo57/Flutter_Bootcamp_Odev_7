import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/data/entity/todos.dart';
import 'package:flutter_bootcamp_odev_7/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  ToDos todo;


  DetaySayfa({required this.todo});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tftodos = TextEditingController();



  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tftodos.text = todo.todos;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detay Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tftodos,decoration: InputDecoration(hintText: "ToDos"),

              ),
              ElevatedButton(onPressed: (){
              context.read<DetaySayfaCubit>().guncelle(widget.todo.todo_id, tftodos.text);
              }, child: const Text("Güncelle")),
            ],
          ),
        ),
      ),
    );
  }
}
