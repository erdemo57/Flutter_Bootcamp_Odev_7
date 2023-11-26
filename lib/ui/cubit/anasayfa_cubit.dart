import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/data/entity/todos.dart';
import 'package:flutter_bootcamp_odev_7/data/repo/todos_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<ToDos>>{

  AnasayfaCubit():super(<ToDos>[]);

  var krepo = TodosDaoRepository();

  Future<void> todosYukle() async {

    var liste = await krepo.todosYukle();
    emit(liste);

  }

  Future<void> ara(String aramaKelimesi) async {

   var liste = await krepo.ara(aramaKelimesi);
   emit(liste);
  }

  Future<void> sil(int todo_id) async {
    await krepo.sil(todo_id);
    todosYukle();

  }

}