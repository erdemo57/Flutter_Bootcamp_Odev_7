import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/ui/cubit/kayit_sayfa_cubit.dart';

class Kayitsayfa extends StatefulWidget {
  const Kayitsayfa({super.key});

  @override
  State<Kayitsayfa> createState() => _KayitsayfaState();
}

class _KayitsayfaState extends State<Kayitsayfa> {
  var tftodos = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todos Kayıt"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tftodos, decoration: const InputDecoration(hintText: "Kisi Ad"),
              ),
              ElevatedButton(onPressed: (){
              context.read<KayitSayfaCubit>().kaydet(tftodos.text);
              }, child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
