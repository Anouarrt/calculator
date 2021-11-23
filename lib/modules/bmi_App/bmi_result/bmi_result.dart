import 'package:flutter/material.dart';

class bmiresultat extends StatelessWidget {
  final bool ismale;
  final int result;
  final int age;


  bmiresultat({required this.ismale,required this.result, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bmi result'),
      leading: IconButton(onPressed: () {
        Navigator.pop(context);    ///   Pour Fair Reteur a le premaire Qui PuSh A moi
      }, icon: Icon(
        Icons.keyboard_arrow_down_outlined,
      )),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gendre : ${ismale ? 'male' : 'female' }"), // C'est On peut faire Quelle que Operqtion On besion de qjouter ${}
            Text("result : $result"),
            Text("age : $age"),
          ],

        ),
      ),
    );
  }
}
