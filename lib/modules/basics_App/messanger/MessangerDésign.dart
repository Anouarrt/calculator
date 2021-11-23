import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';

class MesssangerDesign extends StatelessWidget {

  const MesssangerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20.0,
        elevation: 0, // Pour enlover Elevation Pour ne pas affichier Le Ligne Qui Partitioner Appbar et Body
      title: Row(
        children: [
          CircleAvatar(radius: 20.0,backgroundImage: NetworkImage('https://noir-visuals.com/images/Logo/Noir.jpg'),

          ),
            SizedBox(
              width: 15.0,
            ),
          Text("Chats",
            style: TextStyle( color: Colors.black),
          )

        ],
      ),
        actions: [
          IconButton(
              icon: CircleAvatar(  //   CircleAvatar : Pour Circle N'importe Quoi Sur Votre Projet
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon( Icons.camera_alt,color: Colors.white,),

              )
              , onPressed: (){}),
          IconButton(
              icon: CircleAvatar(  //   CircleAvatar : Pour Circle N'importe Quoi Sur Votre Projet
                radius: 15.0,
                backgroundColor: Colors.blue,
                child: Icon( Icons.edit,color: Colors.white,),

              )
              , onPressed: (){}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300], // Il y a des Couleur Tu peux Le Faire Cette [300] et Il y a des Couleurs Tu peux Pas mets [300]
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(width: 10.0,),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 90.0,
                child: ListView.separated( /// Context :> Pour le Wedget ListView
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildStoryItem(),
                  separatorBuilder: (context,index) => SizedBox(width: 20.0,) ,
                  itemCount: 7, // il ajoute de List Combien de item  index
                ),
              ),





           /*    Expanded(child:

                  ListView.separated(itemBuilder: (context,index) =>  buildChatItem()
                      , separatorBuilder: (context,index) => SizedBox(height: 20.0,),
                      itemCount: 10),


                  ),*/

            ],
          ),
        ),
      ),

    );
  }


  // 1- Build Item
  //  2 - Build list
  // 3 - add Item


// arrow Funcation : > Tu Utilisies Seulement La methode Sons bady Tu peux  Ajouter Seulement Item pas ajouter un Autre Item OU tu fais UN appelle a une Autre Methode : // il return seulement un chois
Widget buildChatItem() =>    Row(
  
  children:[
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(radius: 30.0,backgroundImage: NetworkImage('https://noir-visuals.com/images/Logo/Noir.jpg'),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 3.0,
            end:3.0,
          ),
          child: CircleAvatar(radius: 5.0,backgroundColor: Colors.red,

          ),
        ),
      ],

    ),
    SizedBox(width: 20.0,),
    Expanded(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Anouar Rhouat  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), maxLines: 1,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 5.0,),
          Row(

            children: [


              Expanded(
                child: Text('Hello  anouar Rhouat Hello  anouar Rhouat Hello  anouar Rhouat Hello  anouar Rhouat Hello  anouar Rhouat'
                  ,maxLines: 2,overflow: TextOverflow.ellipsis,
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text("20:03 PM")
            ],
          )
        ],
      ),

    ),


  ],
);// On peut Pas ajouter un Autre
 // On Utilison Widget : > Pour Eviter le Problem de SI On peut Changer Le ROW ou CONTAINER  A centre On besion de Ajouter AUtre fois  ;  Mais a la fin de tous les choises on Utilison Wedget > parce Que Tous de Type Wedget
Widget buildStoryItem() =>   Container(
  width: 60.0,
  child: Column(

    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(radius: 30.0,backgroundImage: NetworkImage('https://noir-visuals.com/images/Logo/Noir.jpg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end:3.0,
            ),
            child: CircleAvatar(radius: 5.0,backgroundColor: Colors.red,

            ),
          ),
        ],
      ),
      Expanded( // Pour le Prend La taille Complet ( J'ai Trouver Quelle Que erreur Sur mon app et Apres j'ai ajouter Expanded et Travaile bien avec Moi
        child: Text(
          'Anouar Rhouat MIloud',
          maxLines: 2, // Pour Spécifier Combien de Ligne a Utilisateur
          overflow: TextOverflow.ellipsis, /// C'est il y a un autre ligne ET il n'a pas de L'espace il va Automatiquement Ajouter 3-point ...
        ),
      ),

    ],
  ),
);



}
