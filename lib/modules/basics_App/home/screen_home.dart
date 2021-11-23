import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screenhome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text('My first bar'),
        actions: [
          IconButton(onPressed: (){print("You have a notifaction");}, icon: Icon(Icons.notifications_active_outlined)),
         IconButton(onPressed:onprinthello , icon: Text("hello"))
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(

        children: [
          Padding( // Utilisation de Padding Pour Mover Le Container
            padding: const EdgeInsets.all(50.0),
            // Poour Ajouter Raduis

            child: Container(
              decoration: BoxDecoration(
              //  borderRadius: BorderRadiusDirectional.only( Pour ajouter raduis  Achque partie que Tu veux
             //     topStart: Radius.circular(20.0)
             //   )
                borderRadius: BorderRadius.circular(20.0),

              ),
              clipBehavior: Clip.antiAliasWithSaveLayer, // Pour Applique border raduis
              child: Stack(
                alignment: Alignment.bottomCenter,   /// Stack + Alignment : Il va Mover Seuelement Le Text Parce Que Li image Il prend TOut La taille de Stack
                children: [
              // Pour Ajouter Un Text Sur Un IMage   On Utilise   STACK
               Image( image: NetworkImage(  //Copier L'address de Image
                'https://www.cnet.com/a/img/wub4Q7jiOP1L3pAfdNQx1FzSgWw=/940x528/2020/04/17/def1b267-b843-4adf-957f-631062cf5bd7/1800-flowers.jpg'
              ),

                height: 200.0,
                 width: 200.0,
           fit: BoxFit.cover, // Pour ZOOM l'Image
         //   fit: BoxFit.fill, // Pour Eviter l'espace

              ),
                  Container(
                    color: Colors.amberAccent.withOpacity(.5), /// Pour Ajouter Opacity
                    width: double.infinity,
               //     padding: EdgeInsets.only(),  Pour Modifire TOP,BOTTOM , RIGHT , left
               //     padding: EdgeInsetsDirectional.only(), //POur Modifier bottom: ,end: , start: ,top:
                    padding: EdgeInsets.symmetric(vertical: 10.0), // Pour Eviter de Ajouter top et Le Bottom Il ajoute systematiquement
                    child: Text(
                      " Flowers ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,color: Colors.white),

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )




    );

  }

}
void onprinthello(){
print("Hello world");
}