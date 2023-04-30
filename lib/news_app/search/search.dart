import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/connestant.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';




class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).Searchdata;

          return ConditionalBuilder(
              condition: list.isNotEmpty,
              builder: (context) =>
                  ListView.separated(
                    itemBuilder: (context,index) =>  BuildArticleItem(list[index],context),
                    separatorBuilder: (context,index) => Padding(
                      padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                      child: Container(
                        height: 1.0,
                        width:  double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    itemCount: 10,
                  ),
              fallback: (context) =>  Container());
        });
  }
}
