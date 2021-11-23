import 'package:conditional_builder/conditional_builder.dart';
import 'package:diapackage/Shared/component/components.dart';
import 'package:diapackage/modules/shop_App/register_Sc/shop_register_screen.dart';
import 'package:diapackage/modules/shop_App/shop_login/state/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/ShopLoginCubit.dart';

class shoplogin extends StatelessWidget {

var fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controlleremail = TextEditingController();
    var controllerpassword = TextEditingController();


    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginstates>(
        listener:(context , state) {},
        builder:(context , state) {
          return Scaffold(
            appBar: AppBar(),
            body:  Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: fromkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          "Login now to Browser our ",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:Colors.blueGrey,
                          ),

                        ),
                        SizedBox(height: 20.0,),
                        defaultTextfiled(
                          type: TextInputType.emailAddress,
                          controller: controlleremail,
                          validate: (String value){
                            if(value.isEmpty){
                              return " You Must be Entre Your Email";
                            }
                          },
                          label: "email",
                          icondata: Icons.email_outlined,
                        ),
                        SizedBox(height: 15.0,),
                        defaultTextfiled(
                          type: TextInputType.visiblePassword,
                          controller: controllerpassword,
                          ispasword: ShopLoginCubit.get(context).ispasword,
                          onSubmit: (value){ // pOUR uTILISATEUR Si Entre le pqssword Et fermer il va Automatiquement Entre
                            if(fromkey.currentState!.validate()){
                              ShopLoginCubit.get(context).userLogin(email: controlleremail.text, password: controllerpassword.text);
                            }
                          },
                          SuffixPressed: (){
                            ShopLoginCubit.get(context).changepasswordvisibilter();
                          },
                          validate: (String value){
                            if(value.isEmpty){
                              return " You Must be Entre Your password";
                            }
                          },
                          label: "password",
                          suffixicondata: Icons.visibility,
                          icondata: Icons.lock_outline,
                        ),
                        SizedBox(height: 20.0,),
                        ConditionalBuilder(
                         condition:  state  is! LoadingShopState ,
                          builder: (context) =>   defaultbtn(

                              function: (){
                                if(fromkey.currentState!.validate()){

                                  ShopLoginCubit.get(context).userLogin(email: controlleremail.text, password: controllerpassword.text);
                                }
                                }, text: "Login"),
                                fallback: (context) =>  Center(child: CircularProgressIndicator()),
                                 ),

                        SizedBox(height: 14.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don\'t have an account ?",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: Colors.black87,
                              ),
                            ),
                            defaultTextbutton(Function:
                                (){
                              navigationto(context,shopregister_screen());
                            },
                                text: "Register ")

                          ],
                        ),

                      ],
                    ),
                  ),

                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
