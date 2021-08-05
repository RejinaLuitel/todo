import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text='Its my text';
  List<String> todos=[];
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height:10),
         TextField(
           controller: _textController,
           decoration: InputDecoration(
             hintText: "Enter",
             labelText: "Type",
               border: OutlineInputBorder(),
             suffix: IconButton(
               icon: Icon(Icons.check),
               onPressed: (){
                 setState(() {
                   todos.add(text);
                 });
                 _textController.clear();
               },
             )
           ),
           onChanged:(value){
             setState(() {
               text=value;
             });
           },
         ),
          SizedBox(height:10),
          if(todos.isNotEmpty)
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){

                return ListTile(
                  tileColor: Colors.blue,
                  title: Text(
                      todos[index],
                    style:TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: (){
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                );
              },
              itemCount: todos.length,
                separatorBuilder: (context, index)=> SizedBox(height:10),
              ),
            )
         
          else Text('Not item in todos')
        ],
      ),
    );
  }
}
