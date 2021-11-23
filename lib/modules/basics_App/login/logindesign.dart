import 'package:diapackage/Shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

//resuable components

//--timing
//-- refactor
//-- quality
// -- Clean code


class loginscreen extends StatefulWidget {

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var emailC = TextEditingController();
  var passC = TextEditingController();

     var formkey = GlobalKey<FormState>();
   bool isPasword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("login =>"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center( // Pour Centre  les WEDGET
          child: SingleChildScrollView( //  Pour Pas Affichier A l'Utilisateur Un Errreur Quand Il overie CLAVIER
            child: Form(  // Je mets la form Avec le KEY => le Tu peux L'ajouter a n'importe WEdget Dans Votre Application Pour Tu peux le Faire a le WEdget avec le Key Que ce Que tu veuts
              key: formkey, // il va activer a  moi la validitor
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                     style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold, //La ligne Gras

                    ),
                  ),
                SizedBox(height: 20.0,),
                  defaultTextfiled(
                    type: TextInputType.emailAddress,
                    controller: emailC,
                    onchange: (String value){
                      print(value);
                    },
                    label: "Email Address",
                    onSubmit: (String value){
                      print(value);
                    },

                    icondata: Icons.email,
                    validate: (value ) {
                      if(value!.isEmpty){  // La forme validation => Si TextFiled et vide il va affichier le message
                        String resultempty = 'You most to Entre Your email ';
                        return resultempty.toUpperCase() ;
                      }
                      return null;     // C'est n'ai pas vide le Textfield il va valider

                    },
                  ),


                  SizedBox(
                    height: 20.0,
                  ),


                  SizedBox(
                    height: 10.0,
                  ),

                  defaultTextfiled(
                    type: TextInputType.visiblePassword,
                    controller: passC,
                    onchange: (String value){
                      print(value);
                    },
                    label: "Password",
                    suffixicondata: isPasword ? Icons.visibility : Icons.visibility_off ,
                    ispasword: isPasword,
                    // Function for Obsecure Password
                    SuffixPressed: ( ){                          /// J'ai convertue Statless to Stateful Comme Ca je peux changer Obscure de Password
                        setState(() {
                          isPasword = !isPasword;
                        });
                    },
                    onSubmit: (String value){
                      print(value);
                    },
                    icondata: Icons.lock,
                    validate: (value ) {
                      if(value!.isEmpty){  // La forme validation => Si TextFiled et vide il va affichier le message
                        String resultempty = 'You most to Entre Your Password **************** ';
                        return resultempty.toUpperCase() ;
                      }
                      return null;     // C'est n'ai pas vide le Textfield il va valider

                    },
                  ),




                  SizedBox(
                    height: 20.0,
                  ),

                  defaultbtn(   // Button Login
                   text: 'Login',
                   background: Colors.blue,
                   isUppercase: true,
                   function: ()
                   {
                     if(formkey.currentState!.validate()){
                     print(emailC.text);
                     print(passC.text);
                   }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),




                  // here register ///
                  defaultbtn(   // Button Login
                    text: 'Register',
                    background: Colors.green,
                    isUppercase: true,
                    function: ()
                    {
                      if(formkey.currentState!.validate()){
                        print(emailC.text);
                        print(passC.text);
                      }
                    },
                  ),


              SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have account',style: TextStyle(fontWeight: FontWeight.bold),),
                      TextButton(onPressed: (){},
                        child: Text(
                              'Regester Now'
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
