
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/users.dart';

class patientItem extends StatelessWidget{
  final User  user;
  const patientItem({Key?key,required this.user}):super(key:key);
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(child: Container(
        color: Colors.black,

      ),
      footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.pink,
        alignment: Alignment.bottomCenter,
        child: Text('${user.patientName}'),
      ),),
    );
  }
}
