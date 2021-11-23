import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Layout/news_app/Cubit/Cubit.dart';
import 'Layout/news_app/Cubit/States.dart';
import 'Shared/component/components.dart';
import 'modules/news_App/Search/Search_screen.dart';






class newLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  //  var cubit =NewCubit.get(context);  Je Sais Pas Pour Quoi Il veux Pas Accepter Cette Maniere

    return BlocConsumer<NewCubit,NewStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            title: Text(
                'News app'
            ),
            actions: [
              IconButton(onPressed: ()
              {
                navigationto(context,search_screen());
              }
              , icon: Icon(
                  Icons.search,
             //   color: Colors.deepOrange,
              )),
              IconButton(onPressed: ()
              {
                NewCubit.get(context).changeAppMode();
              },
                  icon: Icon(
                  Icons.brightness_4_outlined,
             ///   color: Colors.deepOrange,
              )),
            ],



          ),
       /*     floatingActionButton: FloatingActionButton(
              onPressed: (){
                Dio_helper.getData(url: 'v2/top-headlines', query: {
                  'sources':'techcrunch',
                  'apiKey':'87858d79b2484833883a3c8636431bb1',
                }).then((value){
                //  print(value.data.toString());
                  print(value.data["articles"][0]["title"]);  // Comment Je peux Obtenir Les Informations Par I
                }).catchError((erreur){
                  print(erreur.toString());
                });
              },
              child: Icon(
                  Icons.add
              ),
            ),*/
          body: NewCubit.get(context).screns[NewCubit.get(context).Navigationbottomitem]

          ,
          bottomNavigationBar: BottomNavigationBar(
           currentIndex: NewCubit.get(context).Navigationbottomitem,  // Selcationner l'emplacemant Sur Quelle Utilisateur A clique
            selectedItemColor: Colors.deepOrange,

            elevation: 20.0 ,
            items: NewCubit.get(context).BottomNavigation,
            onTap: ( index)
            {
              print(index);
              NewCubit.get(context).changeIndexButtom(index);
            },
          ),

        );
      },
    );
  }
}
