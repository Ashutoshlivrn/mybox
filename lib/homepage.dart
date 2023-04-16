import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool myValue = false;
  double thisHeight = 10 ;

  @override
  Widget build(BuildContext context) {
    List list = [1,2,3,4,5,6,7,8,9];
    List list1 = [1,2,3,4,5,6,7,8,9,'aman','aman','aman','aman','aman','aman','aman','aman',0];
    return Scaffold(
       body: Container(
            height: 400,
           width: 200,
           color: Colors.yellow,
           child:  Column(
             children: [
               Column(
                 children: list1.map((e) {
                   print(e.toString());
                   return Text(
                    // list[e].toString()
                     e.toString()
                 );

                 }
                 ).toList() ,
               ),
             ],
           )
         ),



    );
  }
}
