import 'package:diapackage/Layout/news_app/Cubit/Cubit.dart';
import 'package:diapackage/Shared/bloc_observe.dart';
import 'package:diapackage/Shared/network/local/cache_helper.dart';
import 'package:diapackage/Shared/network/remote/dio_helper.dart';
import 'package:diapackage/news_apps.dart';
import 'package:flutter/cupertino.dart';

import 'package:bloc/bloc.dart';
import 'package:diapackage/Layout/news_app/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main()  async {
  Bloc.observer = MyBlocObserver();  //// Il va affichier a moi tous les choses que on fais Sur l'application avec la Bloc.observer
// Widget app =MyApp();  We Can do This But the best thing  For aDD Name Class Like Methode
  WidgetsFlutterBinding.ensureInitialized();             // Pour Appelle Tous et Apres Runner
  Dio_helper.init(); // Pour le creer
  await CacheHelper.init();
  runApp(MyApp()); // Runapp need a Widget for this we extends a widget
}

// Statless
// Statful


class MyApp extends StatelessWidget {

// Constractor 1 - First Methode  Call Class
// Build  2 - Secend Methode Call Class


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => NewCubit(),


      child: BlocConsumer<NewCubit,NewStates>(
        listener: (context,state){},
        builder: (context,state){

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(        // Pour Applique A bar Completement de L'Applications
              primarySwatch: Colors.deepOrange,  // pour Chnage Tous Les Coleurs Par defauls a  l'Orange
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.green,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                backwardsCompatibility: false, // Pour Tu peux Le Faire Comme Tu veux Sur Status Bar
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,  // status => Pour Modifier Les Colors
                  statusBarColor: Colors.green,

                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.black,
                  )
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),

            ),
            darkTheme: ThemeData(

              primarySwatch: Colors.deepOrange,  // pour Chnage Tous Les Coleurs Par defauls a  l'Orange
              scaffoldBackgroundColor:HexColor("333739"),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: HexColor("333739"),
              ),
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backgroundColor: HexColor("333739"),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  backwardsCompatibility: false,
                  // Pour Tu peux Le Faire Comme Tu veux Sur Status Bar
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,  // status => Pour Modifier Les Colors de les icons
                    statusBarColor: HexColor("333739"),

                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,

                  )
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.white,
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor("333739"),
                unselectedItemColor: Colors.grey,

              ),
              //    scaffoldBackgroundColor: Colors.black,


            ),

            //  themeMode: ThemeMode.light, Je vais Change au Dark mode
            themeMode:  NewCubit.get(context).ismode ? ThemeMode.light : ThemeMode.dark,
            home: newLayout(),

            /*    home: Directionality(
              textDirection: TextDirection.rtl,
              child: newLayout(),
            ),    */  //You need To call classs
            //  home: newsTest(),
          );
        },

      ),
    );
  }

}
