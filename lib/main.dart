
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:async';


void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
class Home extends StatefulWidget
{
 Home();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}
class HomeState extends State<Home> with SingleTickerProviderStateMixin
{

TabController tabController;
@override
void initState()
{super.initState();
  tabController=TabController(length: 3,vsync:this);
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
   appBar: AppBar(
     title: Text("COMBINED"),
     elevation: 2.0,

     backgroundColor: Colors.amber,
     bottom:TabBar(
       controller: tabController,
       tabs: <Widget>[
         Tab(
           child:Text("Home"),

         ),
         Tab(
           child:Text("About"),
         ),
         Tab(
           child:Text("Contact"),
         )
       ],
     ),
   ),
   drawer: Drawer(
     child: ListView(
       children: <Widget>[
         Text("Aditya"),
       ],
     ),
   ),
   floatingActionButton: FloatingActionButton(
     backgroundColor: Colors.white,
     child: Icon(Icons.add,color: Colors.red,),
     onPressed: ()=>showModalBottomSheet(context: context, builder:(context){
       return Column(
         children: <Widget>[
           Text("ADITYA"),
           Text("Harsh"),
           Text("Lion"),
         ],
       );
     })
   ),
   body: TabBarView(
     controller: tabController,
     children: <Widget>[
       Newpage(),
     Newpage(),
       Newpage(),
     ],
   ),
   bottomNavigationBar:Material(
     color: Colors.amber,
     child: TabBar(
       controller: tabController,
       tabs: <Widget>[
         Tab(
           icon: Icon(Icons.add),

         ),
         Tab(
           icon: Icon(Icons.search),
         ),
         Tab(
           icon: Icon(Icons.add),
         )
       ],
     ),
   ) ,
 );
  }

}

class Newpage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewPageState();
  }

}
class NewPageState extends State<Newpage>
{
  int current_step=0;
  List<Step> my_steps=[
    Step(
      title: Text("step 1"),
      content: Text("Hello "),
      isActive: true,
    ),
    Step(
      title: Text("step 2"),
      content: Text("Hello "),
      isActive: true,
    ),
    Step(
      title: Text("step 3"),
      content: Text("Hello "),
      isActive: true,
    ),
    Step(
      title: Text("step 4"),
      content: Text("Hello "),
      isActive: true,
    ),
  ];
  AlertDialog dialog=AlertDialog(
    content: Text("Yo Madarchod hello maa chudao!"),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


        body: ListView(
          children: <Widget>[
            Container(
              child: Center(
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: ()=>Scaffold.of(context).showSnackBar(SnackBar(
                    content:Text("You clicked me"),
                    duration: Duration(seconds: 5),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: RaisedButton(
                child: Text("show dialog"),
                onPressed: ()=>showDialog(context: context,child: dialog),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Stepper(
                steps:my_steps ,
                currentStep: this.current_step,
                type: StepperType.vertical,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],

        )
    );
  }

}