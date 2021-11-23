import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/bmi_result.dart';

class bmistateful extends StatefulWidget {



  @override
  _bmistatefulState createState() => _bmistatefulState();
}

class _bmistatefulState extends State<bmistateful> {

  bool  ismale=true;
  double height = 120.0;
  int age=20;
  int weight=40;


// Color color = Colors.grey;   // J'ai ajoute le Coleur A une Variable comme ca on peux la change

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Bmi Calcolator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
               children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: () {
                       setState(() {
                          ismale = true;
                       });
                     },
                     child: Container(

                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         //   Icon(Icons.ac_unit,size: 70.0,),  On va Change icon par l'image qui on a creer
                         Image(image: AssetImage("assets/images/male.png"),height: 90.0,width: 90.0,),
                           SizedBox(height: 10,),
                           Text("Male",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                         ],
                       ),
                       decoration: BoxDecoration( // Pour  Color Ajouter Décoration a coleur
                         borderRadius: BorderRadius.circular(10.0),
                        // color: color,
                         color: ismale ? Colors.blue : Colors.grey,
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 20.0,),
                 Expanded(
                   child: GestureDetector(
                     onTap: () {
                       setState(() {
                         ismale = false;
                       });
                     },
                     child: Container(

                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image(image: AssetImage("assets/images/famale.png"),height: 90.0,width: 90.0,),
                           SizedBox(height: 10,),
                           Text("Female",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                         ],
                       ),
                       decoration: BoxDecoration( // Pour  Color Ajouter Décoration a coleur
                         borderRadius: BorderRadius.circular(10.0),
                         color: !ismale ? Colors.blue : Colors.grey,
                       ),
                     ),
                   ),
                 ),
               ],
              ),
            ),



          ),



          Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(

                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline, // Pour seligner Sur le meme ligne
                      textBaseline: TextBaseline.alphabetic,         // On besion de Ajouter cette ligne pour par racenter des erreurs
                     children: [
                       Text("${height.round()}",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),),
                       SizedBox(width: 5.0,),
                       Text("cm",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w900),),
                     ],
                    ),
                    Slider(
                        value:height,
                        min: 80,
                        max: 220,

                        onChanged: (value){
                      //    print(value.round()); // ( Round Pour Changer Double To int ) il affichie a vous le number plus présque
                         setState(() {
                           height = value;
                         });
                        }),
                  ],

          ),
                decoration: BoxDecoration( // Pour  Color Ajouter Décoration a coleur
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),

          Expanded(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(

                        decoration: BoxDecoration( // Pour  Color Ajouter Décoration a coleur
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("weight",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                            Text("$weight",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                    heroTag: "weight-",
                                    mini: true, child:Icon(Icons.remove, )),
                                FloatingActionButton(onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                                },
                                    heroTag: "weight+",
                                    mini: true, child:Icon(Icons.add,))
                                // floatingActionButton  : => il prend deux taile mini true
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration( // Pour  Color Ajouter Décoration a coleur
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Age",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                            Text("$age",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                    heroTag: "age-",
                                    mini: true, child:Icon(Icons.remove, )),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                    heroTag: "age+",
                                    mini: true, child:Icon(Icons.add,))
                                // floatingActionButton  : => il prend deux taile mini true
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
             ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            height: 50.0,
            child: MaterialButton(onPressed: ()
            {
              double result = weight / pow(height / 100,2);
              print(result.round());

              // Pour Navigue a un Autre Screen   : Push il fait aller et routeur
              Navigator.push(
                context,      /// le Context Qui  la
                MaterialPageRoute(
                  builder:  (context) => bmiresultat(
                    age: age,result: result.round(),ismale: ismale,
                  ),    /// L'autre Context Qui je vqis arrivies

              ),
              );

            },
            child: Text("CALCULTOR",style: TextStyle(color: Colors.white,),),

            ),
          )
        ],
      ),
    );
  }
}
