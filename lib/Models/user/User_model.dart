import 'package:flutter/material.dart';

class UserModel{
  final int  id;
  final int phone ;
  final String name;

  UserModel(
     @required this.id,  @required  this.phone,  @required  this.name);
}