import 'package:conditional_builder/conditional_builder.dart';
import 'package:diapackage/Shared/component/components.dart';
import 'package:diapackage/Shared/cubit/cubit.dart';
import 'package:diapackage/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class newtask extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,AppState>(
      listener: (context , state){},
      builder:  (context , state)
      {
        var tasks = Appcubit.get(context).newtasks;

        return builedconditionalmethode(tasks);
      },

      );



  }
}
