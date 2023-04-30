import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import '../search/search.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        NewsCubit c = NewsCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              "News App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),

            actions: [
              IconButton(
                  onPressed: ()
                  {

                  },
                  icon: const Icon(Icons.search,color: Colors.black,size: 25.0,)
              ),
            ],
          ),

          body: c.screens[c.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
            currentIndex: c.CurrentIndex  ,
            selectedItemColor: Colors.deepOrange,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                label: "Business"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: "Sports"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined),
                  label: "Science"
              ),
            ],
            onTap: (index)
            {
              c.ChangeScreen(index);
            },
          ),
        );
      },
    );
  }
}
