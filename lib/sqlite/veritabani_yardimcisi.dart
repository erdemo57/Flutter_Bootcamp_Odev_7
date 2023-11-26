import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{
  static final String veritabaniadi = "todo.sqlite";

  static Future<Database>veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniadi);

    if(await databaseExists(veritabaniYolu)){
      print("Veritabanı daha önce kopyalanmış");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniadi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veri Tabanı Kopyalandı");
    }
    return openDatabase(veritabaniYolu);
}
}