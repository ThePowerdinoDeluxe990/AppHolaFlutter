import 'package:flutter/material.dart';
import "bodyApp.dart";

class MyAppBar extends StatelessWidget{
  const MyAppBar({super.key});	 
 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
	appBar: AppBar(
	  title: const Text("Clicker",
	  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
	  backgroundColor: Colors.blue[400],
	),
	
	body:const Center(
	  child:StateBtn()
      ),
    );	
  }
}

void main() {
  runApp(const MaterialApp( home:Scaffold(
	 body: Center( child: MyAppBar(),
	),
      ),
    ),
  );
}

