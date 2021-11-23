
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Layout/news_app/Cubit/Cubit.dart';
import 'Layout/news_app/Cubit/States.dart';
import 'Shared/styles/themes.dart';
import 'modules/shop_App/on_boarding/On_boarding_screen.dart';
import 'news_apps.dart';
import 'Shared/bloc_observe.dart';
import 'Shared/network/local/cache_helper.dart';
import 'Shared/network/remote/dio_helper.dart';


void main()  async {
  Bloc.observer = MyBlocObserver();  //// Il va affichier a moi tous les choses que on fais Sur l'application avec la Bloc.observer
// Widget app =MyApp();  We Can do This But the best thing  For aDD Name Class Like Methode
  WidgetsFlutterBinding.ensureInitialized();             // Pour Appelle Tous et Apres Runner
  Dio_helper.init(); // Pour le creer
  await CacheHelper.init();
  bool ismode = CacheHelper.getbool("ismode");


  runApp(MyApp(ismode)); // Runapp need a Widget for this we extends a widget

}


// Statless
// Statful


class MyApp extends StatelessWidget {
// Constractor 1 - First Methode  Call Class
// Build  2 - Secend Methode Call Class
late final bool ismode;
MyApp(this.ismode);

  @override
  Widget build(BuildContext context) {

    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
              create: ( BuildContext context) => NewCubit()..changeAppMode(
                isfromShared: ismode,
              )),
          BlocProvider(
            create: (BuildContext context) => NewCubit()..getBusiness()..getScience()..getSport(),),
        ],
        child: BlocConsumer<NewCubit,NewStates>(
          listener: (context,state){},
          builder: (context,state){

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LightTheme,
            //  darkTheme: DarkTheme,

              //  themeMode: ThemeMode.light, Je vais Change au Dark mode
              themeMode:  NewCubit.get(context).ismode ? ThemeMode.light : ThemeMode.dark,
              home: onboardinapp(),

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
