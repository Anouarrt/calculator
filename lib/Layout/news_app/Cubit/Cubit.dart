
import 'package:bloc/bloc.dart';
import 'package:diapackage/Shared/network/local/cache_helper.dart';
import 'package:diapackage/Shared/network/remote/dio_helper.dart';
import 'package:diapackage/modules/news_App/business/business.dart';
import 'package:diapackage/modules/news_App/sience/science.dart';
import 'package:diapackage/modules/news_App/sport/sport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class NewCubit extends Cubit<NewStates> {

  NewCubit() : super(NewStateIntialisier());

  static NewCubit get(context) => BlocProvider.of(context);

  int Navigationbottomitem = 0;

  List<BottomNavigationBarItem> BottomNavigation  =[
    BottomNavigationBarItem(
        icon: Icon( Icons.business_sharp,), label: 'business',
    ),
    BottomNavigationBarItem(
        icon: Icon( Icons.science,), label: 'Science',
    ),
    BottomNavigationBarItem(
        icon: Icon( Icons.sports,), label: 'Sport',
    ),
  /*  BottomNavigationBarItem(
        icon: Icon( Icons.settings,), label: 'Setting',
    ),
  */ /* BottomNavigationBarItem(
        icon: Icon( Icons.settings,), label: 'Setting',
    ),*/
  ];

  List<Widget> screns =[business_screen(),science_screen(),sport_screen()];


  void changeIndexButtom(int index){
    Navigationbottomitem = index;
    if(index == 1)
      getScience();
    if(index == 2)
      getSport();
    emit(NewBottomNavState());
  }
  List<dynamic> business =[];
  List<dynamic> sport =[];
  List<dynamic> science =[];
  List<dynamic> search =[];


  void getBusiness(){
      emit(getLoadingstatebuisness());
      Dio_helper.getData(url: 'v2/top-headlines', query: {
        'country':'ma',
        'category':'business',
        'apiKey':'4ecd138c79e74b37985c6e1264cecde7',
      }).then((value){
        business = value.data["articles"];
        print(business[0]);
        emit(getNewStateSuccesBusiness());


      }).catchError((erreur){
        print(erreur.toString());
        emit(getNewStateErreurBusiness(erreur.toString()));

      });

  }

  void getSport(){
    emit(getLoadingstatesport());

    if(sport.length == 0 ){
      Dio_helper.getData(url: 'v2/top-headlines', query: {
        'country':'ma',
        'category':'sport',
        'apiKey':'4ecd138c79e74b37985c6e1264cecde7',
      }).then((value){
        sport = value.data["articles"];
        print(business[0]);
        emit(getNewStateSuccessport());


      }).catchError((erreur){
        print(erreur.toString());
        emit(getNewStateErreursport(erreur.toString()));

      });
    }else{
      emit(getNewStateSuccessport());
    }




  }


  void getScience(){
    emit(getLoadingstatescience());
    if(science.length == 0 ) {
      Dio_helper.getData(url: 'v2/top-headlines', query: {
        'country':'ma',
        'category':'Science',
        'apiKey':'4ecd138c79e74b37985c6e1264cecde7',
      }).then((value) {
        science = value.data["articles"];
        print(business[0]);
        emit(getNewStateSuccesscience());
      }).catchError((erreur) {
        print(erreur.toString());
        emit(getNewStateErreurscience(erreur.toString()));
      });
    }else{
      emit(getNewStateSuccesscience());
    }
  }

  void searche(String Value){
    emit(getLoadingstatesearch());
      search=[];
      Dio_helper.getData(url: 'v2/everything',
          query: {
        'q': '$Value',
        'apiKey': '4ecd138c79e74b37985c6e1264cecde7',
      }).then((value) {
        search = value.data["articles"];
        print(value.data.toString());
        emit(getNewStateSuccessearch());
      }).catchError((erreur) {
        print(erreur.toString());
        emit(getNewStateErreursearch(erreur.toString()));
      });

      emit(getNewStateSuccessearch());

  }

/*  bool ismode = false;

  void changeAppMode()
  {
    print(ismode);
    ismode = !ismode;
  //  emit(AppChangeModeState());
    CacheHelper.putData('ismode', ismode).then((value) {
      emit(AppChangeModeState());
    });

  }*/

  bool ismode = false;

  void changeAppMode({ bool? isfromShared})
  {
    if(isfromShared != null){
      ismode = isfromShared;
      emit(AppChangeModeState());
    }

    else{
      print(ismode);
      ismode = !ismode;

      CacheHelper.putbool("ismode",ismode).then((value) {
        emit(AppChangeModeState());
      });
    }




  }


}