import 'package:bloc/bloc.dart';
import 'package:diapackage/modules/counter_App/Counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());  // j'ai donner a lui le premaire qui il va appler la class

  // to be more easily when use this cubit in many place
  static CounterCubit get(context) => BlocProvider.of(context); //Pour seulement faire une une appelle a cette methode Sur le projet Pour creer une instance ou un Objet

  int counternumber  = 0;


  // minus
  void minus(){
    counternumber--;
    emit(CounterMinusState(counternumber));  // Emit it's a setState for cubit
  }

  //Plus
  void plus(){
    counternumber++;
    emit(CounterPlusState(counternumber));  // Emit it's a setState for cubit
  }


}