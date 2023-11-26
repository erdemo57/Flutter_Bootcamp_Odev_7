import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/data/repo/todos_dao_repository.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

  var trepo = TodosDaoRepository();
  Future<void> kaydet(String todos) async {
    await trepo.kaydet(todos);
  }
}