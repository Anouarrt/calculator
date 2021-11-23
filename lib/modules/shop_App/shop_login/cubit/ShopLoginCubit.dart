import 'package:bloc/bloc.dart';
import 'package:diapackage/Shared/network/end_points.dart';
import 'package:diapackage/Shared/network/remote/dio_helper.dart';
import 'package:diapackage/modules/shop_App/shop_login/state/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginstates>{

  ShopLoginCubit() : super(InisialisiersopState());

  // J'ai Creer class a moi 
  static ShopLoginCubit get(context) =>BlocProvider.of(context);

  void userLogin({required String email,
    required String password,
  })
  {
    print(email + password);
    emit(LoadingShopState());

    Dio_helper.PostData(

        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        },).then((value){
            print(value);
            emit(ShopLoginSuccessState());
    }).catchError((error){

      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
   IconData suffixicon = Icons.visibility_outlined;
   bool ispasword = true;

   void changepasswordvisibilter(){
     ispasword = !ispasword;
     suffixicon = ispasword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
     emit(ShopLoginchangepasswordState());
   }

}