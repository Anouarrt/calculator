import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';

class screen_counter extends StatelessWidget {

 // CounterCubit cubit = BlocProvider.of(context); Pour prends un Objet par l'application completement



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),  // je  fait une appelle a la class cubit
   /*   child: BlocConsumer<CounterCubit,CounterStates>(   // pour le savoir l'emplacement de repload
      listener: (BuildContext context , CounterStates state){
        if(state is CounterPlusState) print(state.counter); // j'ai prend L'objet par listener data
        if(state is CounterMinusState) print(state.counter);
      } ,
        builder: (context , state){  // reteurner a moi le design    // repload par listener prend
        return Scaffold(
          appBar: AppBar(
            title: Text("counter"),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  //       setState(() {

                  CounterCubit.get(context).minus(); // > 0 ?  CounterCubit.get(context).counternumber-- :  CounterCubit.get(context).counternumber;
                  //     });
                }, child: Text("Minus",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green),  ),),
                SizedBox(width: 26.0,),
                Text('${CounterCubit.get(context).counternumber}',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 26.0,),
                TextButton(onPressed: (){
                  //   setState(() {
                  CounterCubit.get(context).plus();
                  //    });
                },
                  child: Text("Plus",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),)
              ],
            ),
          ),
        );
        },
      ),*/
    );
  }
}
