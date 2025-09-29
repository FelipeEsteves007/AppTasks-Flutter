 import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
   const MyFirstWidget({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Container(
       color: Colors.white,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Stack(
             alignment: AlignmentDirectional.center,
             children: [
               Container(color: Colors.red, width: 150, height: 150),
               Container(color: Colors.blue, width: 100, height: 100),
             ],
           ),
           Stack(
             alignment: AlignmentDirectional.center,
             children: [
               Container(color: Colors.blue, width: 150, height: 150),
               Container(color: Colors.red, width: 100, height: 100),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(color: Colors.amber, width: 50, height: 50),
               Container(
                 color: Colors.deepPurpleAccent,
                 width: 50,
                 height: 50,
               ),
               Container(color: Colors.deepOrange, width: 50, height: 50),
             ],
           ),
           Container(
             color: Colors.green,
             height: 30,
             width: 300,
             child: Text(
               "Hello World",
               style: TextStyle(color: Colors.white, fontSize: 20),
               textAlign: TextAlign.center,
             ),
           ),
           ElevatedButton(
             onPressed: () {
               //print("Você apertou o botão");
             },
             child: Text("Aperte o botão"),
           ),
         ],
       ),
     );
   }
 }
