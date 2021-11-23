import 'package:diapackage/Layout/news_app/Cubit/Cubit.dart';
import 'package:diapackage/Layout/news_app/Cubit/States.dart';
import 'package:diapackage/Shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class search_screen  extends StatelessWidget {
  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var list =NewCubit.get(context).search;


    return BlocConsumer<NewCubit,NewStates>(
      listener: (context,state){},
        builder:  (context,state){
        return Scaffold(
          appBar: AppBar(),
          body:  Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
              defaultTextfiled(
              controller: SearchController,
              type: TextInputType.text,
              onchange: (String  value){
                  NewCubit.get(context).searche(value);
              },
              validate: (String  value)
              {
                if(value.isEmpty){
                  return "Search must be Empty";
                }
                return null ;
              },//validor
              label: "Search",
              icondata: Icons.search,


            ),
            Expanded(
                child: articlebuilder(list,context)),
            ],
            ),
          ),
        );
        },

    );



  }
}
