import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/data/entity/todos.dart';
import 'package:flutter_bootcamp_odev_7/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter_bootcamp_odev_7/ui/views/detay_sayfa.dart';
import 'package:flutter_bootcamp_odev_7/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {

  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;


  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().todosYukle();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramasonucu){
          context.read<AnasayfaCubit>().ara(aramasonucu);
          },
        ) :
        const Text("ToDos") ,
      actions: [
        aramaYapiliyorMu ?
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = false;
          });
          context.read<AnasayfaCubit>().todosYukle();
        }, icon: const Icon(Icons.clear)) :
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = true;
          });
        }, icon: const Icon(Icons.search)),
              ],
      ),

      body: BlocBuilder<AnasayfaCubit,List<ToDos>>(
        builder: (context,todoListesi){
          if(todoListesi.isNotEmpty){
           return ListView.builder(
              itemCount: todoListesi.length,
              itemBuilder: (context,indeks){
                var todo = todoListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(todo: todo),))
                        .then((value)  {
                      context.read<AnasayfaCubit>().todosYukle();
                    });
                  },
                  child: Card(
                    child: SizedBox( height: 100,
                      child: Row( mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(todo.todos,style: const TextStyle(fontSize: 20),),
                          ),
                          Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${todo.todos} silinsin mi?"),
                                  action : SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                     context.read<AnasayfaCubit>().sil(todo.todo_id);
                                    },
                                  )
                              ),

                            );
                          }, icon: Icon(Icons.clear))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Kayitsayfa(),))
          .then((value)  {
          context.read<AnasayfaCubit>().todosYukle();
          });
        }, 
        child: const Icon(Icons.add),
      ),
    );
  }
}
