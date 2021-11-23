
import 'package:conditional_builder/conditional_builder.dart';
import 'package:diapackage/Layout/news_app/Cubit/Cubit.dart';
import 'package:diapackage/Layout/news_app/Cubit/States.dart';
import 'package:diapackage/Shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class business_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewStates>(
      listener: (context,state) {} ,
      builder: (context,state) {


      return articlebuilder(NewCubit.get(context).business, context);
  });
}
}