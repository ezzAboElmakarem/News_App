import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio_helper/dio_helper.dart';

import '../news_app/business_screen/business_screen.dart';
import '../news_app/science_screen/science_screen.dart';
import '../news_app/sports_screen/sports_screen.dart';


class NewsCubit extends Cubit<AppStates>
{
  NewsCubit() : super(InitialState());

  static  NewsCubit get (context) => BlocProvider.of(context);

int CurrentIndex = 0 ;
List <dynamic> businessdata = [];
List <dynamic> sportsdata = [];
List <dynamic> sciencedata = [];

  List <Widget> screens =[
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
];


void ChangeScreen (int index) {

  CurrentIndex = index;
  emit(ChangeBottomNavBar());
}

void GetBusiness()
{
emit(BusinessLoading());
  dio_helper.getdata(
      uri: "v2/top-headlines",
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'d889c841bfe0432c9d72a801b498697a'
      }).then((value) {
        businessdata = value.data['articles'];
    print(businessdata[0]['title']);
    emit(GetBusinessSuccess());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetBusinessFailed(error));
  });
}


  void GetSports()
  {
    emit(SportsLoading());
    dio_helper.getdata(
        uri: "v2/top-headlines",
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'d889c841bfe0432c9d72a801b498697a'
        }).then((value) {
      sportsdata = value.data['articles'];
      print(sportsdata[0]['title']);
      emit(GetSportsSuccess());
    }).catchError((error)
    {
      print(error.toString());
      emit(GetSportsFailed(error));
    });
  }

  void GetScience()
  {
    emit(ScienceLoading());
    dio_helper.getdata(
        uri: "v2/top-headlines",
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'d889c841bfe0432c9d72a801b498697a'
        }).then((value) {
      sciencedata = value.data['articles'];
      print(sciencedata[0]['title']);
      emit(GetScienceSuccess());
    }).catchError((error)
    {
      print(error.toString());
      emit(GetScienceFailed(error));
    });
  }

  List <dynamic> Searchdata = [];


  void GetSearch(String value)
  {
    Searchdata = [];

    emit(SearchLoading());
    dio_helper.getdata(
        uri: "v2/everything",
        query: {

          'q':'${value}',
          'apiKey':'d889c841bfe0432c9d72a801b498697a'
        }).then((value) {
      Searchdata = value.data['articles'];
      print(Searchdata[0]['title']);
      emit(GetSearchSuccess());
    }).catchError((error)
    {
      print(error.toString());
      emit(GetSearchFailed(error));
    });
  }


}