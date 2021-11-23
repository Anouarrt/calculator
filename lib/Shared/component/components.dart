import 'package:conditional_builder/conditional_builder.dart';
import 'package:diapackage/Layout/news_app/Cubit/Cubit.dart';
import 'package:diapackage/modules/news_App/WebView/Web_view_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../cubit/cubit.dart';




Widget defaultbtn({    // On ajouter Les parametters par defaults
 width = double.infinity,   //Si la methode Qui prend pas une Valeur Sur Le parametters Il va par defaults il prend Les Valeurs Que On qjouter
    background=Colors.blue,
  bool isUppercase=true,
    @required  function,
    required String text,
}) =>   Container(
  width: width,
  color: background,
  child: MaterialButton( onPressed: function, child: Text(
isUppercase ? text.toUpperCase() : text ,style: TextStyle(color: Colors.white),
  ),),
);







Widget defaultTextfiled({
       @required  controller,
       @required  type  ,
       onSubmit,
       onchange,
       ontap,
       @required  validate,
       @required  label="Null",
       icondata ,
       suffixicondata,
       bool ispasword = false,
       @required SuffixPressed,
        bool isClickable = true,

})=>

   TextFormField(
controller: controller, /// J'ai Prend Le Variable Qui Sons Dans TextfromFiled
keyboardType: type, /// Pour Samplifier A l'Utilisateur Pour Voir Le tous les caracters de Email tu Specifier a l'Utilisateur de Ecrire
onFieldSubmitted: onSubmit, // Pour Affichier Tous Qui ecrire Sur Input // j'ai Ajouté value Sont Type Parce que je Sais pas A quoi lùUtilisqteur Il vq Sqisier
onChanged: onchange,
obscureText: ispasword,                            /// pour cachez le password C'est == true
 validator:  validate,
enabled: isClickable,
onTap: ontap,
decoration: InputDecoration(
labelText: label,
border: OutlineInputBorder(), // Design Le Border Avec La ligne RECTAngle
prefixIcon: Icon(
  icondata,
),
suffixIcon: suffixicondata != null ? IconButton(onPressed: SuffixPressed , icon: Icon(
  suffixicondata,
),)  : null,
),

);
// Dismissible  : Pour Glaissier Sur le Emplacement Que Tu veux
    Widget buildtask(Map Model,context) =>  Dismissible(
  //  final String iduser=Model['id'].toString();

   key: UniqueKey(),
    child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text("${Model['date']}"),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${Model['time']}",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,

                ),



              ),

              Text("${Model['title']}",

                style: TextStyle(

                  color: Colors.grey,



                ),



              ),

            ],

          ),

        ),

        SizedBox(width: 20.0,),

        IconButton(onPressed: ()

        {

          Appcubit.get(context).updatedate(status: 'done', id: Model['id'],);

        }

        , icon: Icon(Icons.check_box , color:Colors.black,)),

        IconButton(onPressed: ()

        {Appcubit.get(context).updatedate(status: 'archive', id: Model['id'],);}

        , icon: Icon(Icons.archive , color:Colors.green,))

      ],

    ),

  ),
   onDismissed: (diercation)
    {
      Appcubit.get(context).Deletefromtable(id: Model['id'],);
      },
    );


    Widget builedconditionalmethode(@required tasks) => ConditionalBuilder(
        condition: tasks.length > 0,
        builder: (context)=>  ListView.separated(itemBuilder: (context,index) => buildtask(tasks[index], context),
            separatorBuilder: (context,index) => Padding(
              padding: const EdgeInsetsDirectional.all(20.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: tasks.length),
        fallback: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 100.0,
                color: Colors.red,
              ),
              Text(
                'No tasks Yet Please Entre Tasks',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        )

    );



Widget business_Widget(article , context) => InkWell( //InkWell : Pour Faire Clique Sur listView
  onTap: (){
    navigationto(article, webview(article['url']));
  },

  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          height: 140.0,

          width: 140.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),



          ),



        ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Text("${article['title']}" , style: Theme.of(context).textTheme.bodyText1, maxLines: 4,overflow: TextOverflow.ellipsis,),

                Expanded(child: Text("${article['publishedAt']}" , style: TextStyle(color: Colors.deepOrange,fontSize: 10.0 ,fontWeight: FontWeight.w900),))

              ],

            ),

          ),

        )

      ],

    ),

  ),
);


Widget mydriverSeprated() => Padding(
  padding: const EdgeInsetsDirectional.all(20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);



// BIGG Artiacle Builder
Widget articlebuilder(list, context) => ConditionalBuilder(
  //  condition: state is! getLoadingstatebuisness,  // Il va T'affichier A vous Une Erreur Parce Que si l'utilisateur N'est pas Encore Clique
  condition: list.length > 0,
  builder: (context) => ListView.separated(
      itemBuilder: (context,index) =>  business_Widget(NewCubit.get(context).business[index],context),
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context,index) => mydriverSeprated(),
      itemCount: 10) ,
  fallback: (context) => Center(child: CircularProgressIndicator()),

);

void navigationto( context , Widget) =>  Navigator.push(
  context,      /// le Context Qui  la
  MaterialPageRoute(
    builder:  (context) => Widget,
  ),
);

/// TextButton

Widget defaultTextbutton( {
  @required Function   ,
  required String text ,
}) =>  TextButton(onPressed: Function, child: Text(text.toUpperCase()));