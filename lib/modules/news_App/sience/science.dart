import 'package:conditional_builder/conditional_builder.dart';
import 'package:diapackage/Layout/news_app/Cubit/Cubit.dart';
import 'package:diapackage/Layout/news_app/Cubit/States.dart';
import 'package:diapackage/Shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class science_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewStates>(
        listener: (context,state) {} ,
        builder: (context,state) {


          return articlebuilder(NewCubit.get(context).science, context);


            /*ConditionalBuilder(
            condition: NewCubit.get(context).sport.length > 0,

            builder: (context) => ListView.separated(
                itemBuilder: (context,index) =>  business_Widget(NewCubit.get(context).sport[index]),
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context,index) => mydriverSeprated(),
                itemCount: 10) ,
            fallback: (context) => Center(child: CircularProgressIndicator()),

          );*/
        });
  }
}