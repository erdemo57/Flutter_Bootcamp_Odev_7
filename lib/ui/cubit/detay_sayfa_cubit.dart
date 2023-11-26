import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/data/repo/todos_dao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var trepo = TodosDaoRepository();


  Future<void> guncelle(int todo_id, String todos) async {
   await trepo.guncelle(todo_id, todos);
  }
}