
import 'package:bloc/bloc.dart';
import 'package:diapackage/Shared/cubit/states.dart';
import 'package:diapackage/modules/todo_App/archived_tasks/archived_tasks_screen.dart';
import 'package:diapackage/modules/todo_App/done_tasks/done_tasks_screen.dart';
import 'package:diapackage/modules/todo_App/new_tasks/new_tasks_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class Appcubit extends Cubit<AppState>
{
  Appcubit() : super(appinitialState());

  static Appcubit get(context) => BlocProvider.of(context);
     List<Map> tasks = [];
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];

  Database? database;
  int placeindex = 0;
  List<Widget> screens =[
    newtask(),
    donetask(),
    archived(),
  ];
  List<String> titles =[
    'New Task',
    ' Done Task',
    'Archived Task',
  ];

  void changeIndex(int index){
    placeindex = index;
    emit(appchangeBottomNavbarchange());
  }

  void createDatebase(){  // Je vais onlover async
    /// ID int TO >  Integer
    /// String tO > TEXT
    openDatabase(
      'todo.db',
      version: 1, // Si j'ai changer ou bien J'ai ajouter un Autre table je incremente la valeur >
      onCreate:  (database,version){ // database il creer  un objet  de la base de donnes Sur open Aussi  il Creer Sur le meme tempts et Apres il creer on haut Sur la base de donnes
        print("DataBase created");
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT)').then((value) =>
        {
          print('table Created')
        }).catchError((erreur){
          print("Erreur When Creating Table ${erreur.toString()}");
        });



      },
      onOpen: (database) {
      getdatefromdatabase(database);

      /*    .then((value) {
 *//*setState(() {
  tasks = value;
  });*//*
        tasks = value;
        print(tasks);
        emit(AppGetDatabaseState());
        });*/ /// on ajouter database parce objet et creer avent ajouter on haut
        print("database open");
      },

    ).then((value){
      database = value;
      emit(appcreatedatabase());
    });

  }


   createInsert({    @required title , @required  date , @required time}) async  {
    print(title.toString());
    print(date.toString());
    print(time.toString());

    await database!.transaction((txn) {
      txn.rawInsert(

          'INSERT INTO tasks (title, date,time,status) VALUES ("$title","$date","$time","new_tasks")')
          .then((value)
      {
        print('$value inserted Successfully');
        emit(AppInsertDatabaseState());
        getdatefromdatabase(database);

      }).catchError((erreur)
      {
        print('erreur When you Inserting new record ${erreur.toString()}');
      });
      return null;
    });
  }
void getdatefromdatabase(database){

emit(AppGetDatabaseLoadingState());
database.rawQuery("SELECT * from  tasks").then((value){
  value.forEach((element){
    if(element['status'] == 'new_tasks')
      newtasks.add(element);
    else if(element['status'] == 'done')
      donetasks.add(element);
    else
      archivetasks.add(element);

  });
 /* newtasks = value;
  print(tasks);*/

   emit(AppGetDatabaseState());
 });




  }
  bool bottomsheetshown = false;
  IconData iconData = Icons.edit;


  void changeIcon({@required isShow , @required DataIcon  })
  {
    bottomsheetshown = isShow;
    iconData = DataIcon;
    emit(buttomchangestate());
}

 void  updatedate({
@required status,
@required id,
}) async
{
await database!.rawUpdate('UPDATE tasks  SET status=? WHERE id=?',['$status',id]).then((value)  {
  getdatefromdatabase(database);
  emit(AppUpdateDatabaseState());
}

);
}


  void  Deletefromtable({
    @required id,
  }) async
  {
     database!.rawDelete('DELETE FROM tasks WHERE id=?',[id]).then((value)  {
      getdatefromdatabase(database);
      emit(AppDeleteDatabaseState());
    }
    );
  }



}