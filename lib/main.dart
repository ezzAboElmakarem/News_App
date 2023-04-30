import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/block_observer/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import 'cubit/states.dart';
import 'news_app/news_screen/news_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dio_helper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsCubit()
              ..GetBusiness()
              ..GetSports()
              ..GetScience(),
          ),
        ],
        child: BlocConsumer<NewsCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const NewsScreen(),
              );
            }));
  }
}

/*
..GetBusiness()..GetSports()..GetScience()*/

/*

MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: const NewsScreen(),
),*/
