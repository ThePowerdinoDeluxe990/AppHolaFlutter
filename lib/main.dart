import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateBtn extends StatefulWidget{
  const StateBtn({super.key});

  @override
  State<StateBtn> createState() => _StateBtnState();
}

class _StateBtnState extends State<StateBtn>{
  int _count = 0;
  
  Color textColor = const Color(0xf5f5f5);

  void _useCount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      _count++;   
      prefs.setInt("value",_count);
    });
  }

  void _removeCount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _count--;
      prefs.setInt("value", _count);
    });
  }

  void _returnCero() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      _count = 0;
      prefs.setInt("value", _count);
    });
  }

  @override
  void initState(){
    super.initState();
    _loadPreferencies();
  }

  _loadPreferencies() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
     _count = prefs.getInt("value") ?? 0;     
    });
  }

 @override
  Widget build(BuildContext context){
    return
     Container(
      color: Colors.white,
	child:Column(
	  mainAxisAlignment: MainAxisAlignment.center,
	  children: <Widget>[
	    Text("$_count",
		 style:const TextStyle(fontSize:24)),
	    Row(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
		ElevatedButton(onPressed:_useCount,  
				child: const Text("Sumar",
				style:TextStyle(color: Colors.black)),
				style: ElevatedButton.styleFrom(	
			        backgroundColor: Colors.blueAccent,
			        elevation: 0,
		  ),
		),
		ElevatedButton(onPressed:_removeCount,  
				child: const Text("Restar",
				style:TextStyle(color: Colors.black)),
				style: ElevatedButton.styleFrom(	
			        backgroundColor: Colors.redAccent,
			        elevation: 0,
		    ),
		  ),
		ElevatedButton(onPressed:_returnCero,  
				child: const Text("Eliminar",
				style:TextStyle(color: Colors.black)),
				style: ElevatedButton.styleFrom(	
			        backgroundColor: Colors.grey,
			        elevation: 0,
		    ),
		  ),
		],
	      ), 
	    ],
	    )
	);
  }	
}	


class MyAppBar extends StatelessWidget{
  const MyAppBar({super.key});	 
 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
	appBar: AppBar(
	  title: const Text("Hola",
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

