import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StateBtn extends StatefulWidget{
  const StateBtn({super.key});

  @override
  State<StateBtn> createState() => _StateBtnState();
}

class _StateBtnState extends State<StateBtn>{
  int _count = 0;
  bool _theme = false;


  void _useCount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      _count++;   
      prefs.setInt("value",_count);
    });
  }

  void _changeTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _theme = !_theme;
      prefs.setBool("boolvalue", _theme);
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
     _theme = prefs.getBool("boolvalue") ?? false;
    });
  }

 @override
  Widget build(BuildContext context){
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
	child:const Icon(Icons.lightbulb_outline, color: Colors.red,),
	backgroundColor: _theme ? Colors.black87 : Colors.white70,
	onPressed: (){
	  _changeTheme();
	}
      ),

     body:Container(
      color: _theme ? Colors.white : Colors.black87,
	child:Column(
	  mainAxisAlignment: MainAxisAlignment.center,
	  children: <Widget>[ 
	      Text("$_count",
		  style:TextStyle(fontSize:24,
				  color: _theme ? Colors.black : Colors.white),
	      ),
	      Row(
		  mainAxisAlignment: MainAxisAlignment.center,
		  children: <Widget>[
		  ElevatedButton(onPressed:_useCount,  
				child: const Text("Sumar",
				style:TextStyle(color: Colors.black)),
				style: ElevatedButton.styleFrom(	
			        backgroundColor: Colors.blueAccent,
			        elevation: 0	  ),
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
	  ]
	),	
      ),
    );
  }
}	


