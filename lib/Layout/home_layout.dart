import 'package:conditional_builder/conditional_builder.dart';
import 'package:diapackage/Shared/component/components.dart';
import 'package:diapackage/Shared/cubit/cubit.dart';
import 'package:diapackage/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class screenHome  extends StatelessWidget
  {




 // late Database database;  je Vais a jouter la base de donnes a cubit
  var scaffolkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();




  var titlecontroller = TextEditingController();
  var timecontroller  = TextEditingController();
  var datecontroller  = TextEditingController();

  @override
  Widget build(BuildContext context) {
   // Appcubit appcubit =  Appcubit.get(context); // Pour samplifier le code

  return BlocProvider(
    create: (BuildContext context) => Appcubit()..createDatebase(),
    child: BlocConsumer<Appcubit,AppState> (
      listener: (BuildContext context , AppState state) {
        if(state is AppInsertDatabaseState){
          Navigator.pop(context);
        }
      } ,
      builder: (BuildContext context , AppState state)   {
        return Scaffold(
        key: scaffolkey,
        appBar: AppBar(
        title: Text(

            Appcubit.get(context).titles[Appcubit.get(context).placeindex],
        ),

        ),
        body: ConditionalBuilder(
       // condition: tasks.length > 0,  // On va A jouter setState A chaque Quand il envoye un valeur il reload la page Avec setState
          condition: state is! AppGetDatabaseLoadingState,
          builder: (context) => Appcubit.get(context).screens[Appcubit.get(context).placeindex],
        fallback: (context) => Center(child: CircularProgressIndicator()),
        )  ,           // On va Utilisier la condition builder
        floatingActionButton: FloatingActionButton(onPressed: (){
          print("floating button");
      if(Appcubit.get(context).bottomsheetshown){
         print("You Are not allowed");
        if(formkey.currentState!.validate()) {
            Appcubit.get(context).createInsert(
                title: titlecontroller.text,
                date: datecontroller.text,
                time: timecontroller.text);

        // inseration  : > > >
/*          createInsert(
            title: titlecontroller.text,
            date: datecontroller.text,
            time: timecontroller.text,
             ).then((value) {
            getdatefromdatabase(database).then((value) {
            Navigator.pop(context);
             *//* setState(() {
           //   bottomsheetshown = false;
           iconData =Icons.edit;
            tasks = value;
           });*//*
           });
             });*/

     }

        }else{
        Appcubit.get(context).iconData;
        scaffolkey.currentState!.showBottomSheet((context) =>
        Container(
        color: Colors.grey[200],
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
        key: formkey,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        defaultTextfiled(
        controller: titlecontroller,
        type: TextInputType.text,
        validate: (String value){
        if(value.isEmpty){
        return 'title  must not Empty';
        }
        return null ;
        },
        label: 'Task Title',
        icondata: Icons.title,

        ),
        SizedBox(height: 22.0,),
        defaultTextfiled(
        controller: timecontroller,
        type: TextInputType.datetime,
        //  isClickable: false,
        validate: (String value){
        if(value.isEmpty){
        return 'time  must not Empty';
        }
        return null ;
        },
        ontap: (){
        showTimePicker(context: context,
        initialTime: TimeOfDay.now(),
        ).then((value)  {
        timecontroller.text = value!.format(context).toString();
        print(value.format(context));
        });
        },
        label: 'task Time',
        icondata: Icons.watch_later_outlined,

        ),
        SizedBox(height: 22.0,),
        defaultTextfiled(
        controller: datecontroller,
        type: TextInputType.datetime,
        //    isClickable: false,
        validate: (String value){
        if(value.isEmpty){
        return 'Date  must not Empty';
        }
        return null ;
        },
        ontap: (){
        showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.parse('2021-10-05')
        ).then((value) {
        //  print(DateFormat.yMMMd().format(value!));
        datecontroller.text = DateFormat.yMMMd().format(value!);
        });
        },
        label: 'task Date',
        icondata: Icons.calendar_today,

        ),

        ],
        ),
        ),
        ),
        ),

        ).closed.then((value) {     // J'ai ajouter Cette ligne Pour Si l'Utilisateur fermer bottemsheets manuale  il va Change l Icone et variable pour pas a la veuner affichier une message
        Appcubit.get(context).bottomsheetshown = false;
        Appcubit.get(context).changeIcon(isShow: false, DataIcon: Icons.edit);
       /*  setState(() {
       iconData =Icons.edit;
        });*/
        });
        Appcubit.get(context).bottomsheetshown = true;
        Appcubit.get(context).changeIcon(isShow: true, DataIcon: Icons.add);
        /*  setState(() {
        iconData =Icons.add;
       });*/
        }




        },child: Icon(Appcubit.get(context).iconData),),
    bottomNavigationBar: BottomNavigationBar(
    // Tu mets le type il y a deux type le 1 -  type: BottomNavigationBarType.shifting,  Il n'affichie rien  jusque tu cliques pour   1 -  type: BottomNavigationBarType.fixed, // il affichie a vous
    type: BottomNavigationBarType.fixed,


    // il va change l'emplacement parce que on Utilisie StatefulWedget avec Foncation State
     currentIndex:  Appcubit.get(context).placeindex,   // liste pour variable
    onTap: (index){
      Appcubit.get(context).changeIndex(index);


   // currentIndex: placeindex,
/*  setState(() {
    placeindex = index;

    });*/
    },



    items: [
    BottomNavigationBarItem(icon: Icon(Icons.menu) , label: 'Tasks' ),
    BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline) , label: 'Done' ),
    BottomNavigationBarItem(icon: Icon(Icons.unarchive_outlined) , label: 'Archived' ),
    ],
    ),
    );
      },
    ),


  );
  }

/*  @override
  void initState() {
  super.initState();
  createDatebase();

  }*/

  /* String getname(){
    return 'anouar rhouat';
  }*/

// Utilisation de futur  & async  & await

/*  Ajoute la methode dans le background =>*/
/*  Future<String>  getname() async{
  return 'anouar rhouat';
  }*/




}
