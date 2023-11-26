import 'package:flutter_bootcamp_odev_7/data/entity/todos.dart';
import 'package:flutter_bootcamp_odev_7/sqlite/veritabani_yardimcisi.dart';

class TodosDaoRepository{
  Future<void> kaydet(String todos) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var yeniToDos = Map<String,dynamic>();
    yeniToDos["todos"] = todos;
    
    await db.insert("todos", yeniToDos);
  }

  Future<void> guncelle(int todo_id, String todos) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();


    var guncelenenToDos = Map<String,dynamic>();
    guncelenenToDos["todos"] = todos;

    await db.update("todos", guncelenenToDos, where: "todo_id = ?", whereArgs: [todo_id]);

  }
  Future<List<ToDos>> todosYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
     List<Map<String,dynamic>> satirlar = await db.rawQuery("SELECT * FROM todos");

     return List.generate(satirlar.length, (index) {
       var satir = satirlar[index];
       var todo_id = satir["todo_id"];
       var todos = satir["todos"];

       return ToDos(todo_id: todo_id, todos: todos);
     },);
  }

  Future<List<ToDos>> ara(String aramaKelimesi) async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> satirlar = await db.rawQuery("SELECT * FROM todos WHERE todos like '%$aramaKelimesi%'");

    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var todo_id = satir["todo_id"];
      var todos = satir["todos"];

      return ToDos(todo_id: todo_id, todos: todos);
    },
    );


  }

  Future<void> sil(int todo_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("todos",where: "todo_id = ?", whereArgs: [todo_id]);
  }

}