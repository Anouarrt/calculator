
import 'package:diapackage/Shared/component/components.dart';
import 'package:diapackage/Shared/styles/colors.dart';
import 'package:diapackage/modules/shop_App/shop_login/shop_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BordingModel{
  late final String image;
  late final String title;
  late final String body;

  BordingModel({required this.image , required this.title , required this.body}){
  }

}


class onboardinapp extends StatefulWidget {

  @override
  State<onboardinapp> createState() => _onboardinappState();
}

class _onboardinappState extends State<onboardinapp> {
  var BoardController = PageController();

  List<BordingModel>  boarding = [
    BordingModel(
        image: 'assets/images/onbord.png',
      title: 'On bored 1 title ',
      body: 'On bored 1 body ',
    ),
    BordingModel(
        image: 'assets/images/onbord.png',
      title: 'On bored 2 title ',
      body: 'On bored 2 body ',
    ),
    BordingModel(
        image: 'assets/images/onbord.png',
      title: 'On bored 3 title ',
      body: 'On bored 3 body ',
    ),
  ];

  bool islast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextbutton(Function:(){
            navigationto(context,shoplogin());
          } ,
             text: " SKIP",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: BoardController,
                onPageChanged: (int index){  // Pour on peut acceder a la dernier et Affichier une message
                  if(index == boarding.length - 1){
                  setState(() {
                    islast = true;
                  });

                  }else{
                    setState(() {
                      islast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),  // Pour C'est Utilisateur Glisser Il n'affiche Rien MAis il glisser tous la page
                itemBuilder: (context,index)=>buildboarditem(boarding[index]),
              itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                     controller: BoardController,
                     effect: ExpandingDotsEffect(
                       dotColor: Colors.blue,
                       dotHeight: 10.0,
                       activeDotColor: drafultColor,
                       dotWidth: 10.0,
                       expansionFactor: 4,
                       spacing: 5,
                     ),
                     count: boarding.length,
                ),
                Spacer(), // Pour L'ajouter a la dernier de ROW
                FloatingActionButton(
                  onPressed: (){
                    if(islast){
                      navigationto(context,shoplogin());
                    }else{
                      BoardController.nextPage(
                        duration: Duration(milliseconds: 700),
                        curve: Curves.fastLinearToSlowEaseIn, // Ou Do Your choses in Animation
                      );
                    }
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                ),
                )
              ],
            ),
          ],
        ),
      ) ,
    );
  }

  Widget buildboarditem(BordingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(height: 20.0,),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20.0,),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
