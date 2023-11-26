import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_odev_7/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter_bootcamp_odev_7/ui/cubit/detay_sayfa_cubit.dart';
import 'package:flutter_bootcamp_odev_7/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:flutter_bootcamp_odev_7/ui/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KayitSayfaCubit(),),
        BlocProvider(create: (context) => DetaySayfaCubit(),),
        BlocProvider(create: (context) => AnasayfaCubit(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
