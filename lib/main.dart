import 'dart:async';
import 'package:flutter/material.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/home_bloc.dart';
import 'pages/home.dart';

Future<void> main() async {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        bloc: HomeBloc(),
        child: HomePage(),
      ),
    );
  }
}
