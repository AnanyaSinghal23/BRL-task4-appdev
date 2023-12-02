import 'package:brl_task4/screens/teamD2.dart';
import 'package:brl_task4/ResourceM/Resources.dart';
import 'package:brl_task4/screens/chat.dart';
import "package:flutter/material.dart";
import 'package:table_calendar/table_calendar.dart';
import '../utils/Routes.dart';
import 'LResign.dart';
import 'MResign.dart';
import 'addTask.dart';
import 'dashboard.dart';
class t_detail extends StatefulWidget {
   t_detail({required this.team});
  dynamic team;
  @override
  State<t_detail> createState() => _t_detailState();
}

class _t_detailState extends State<t_detail> {
  // List<dynamic> domains =team['domains'];
  dynamic teams;
  String? email=name;
  // String? domainName;
  String? leaderEmail;
  String? teamName;
  String? teamCode;
  String? teamId;
  Future<void>? _futureData;
  void initState() {
    super.initState();
    // _futureData =api();
  }
  List<dynamic>? domains;
  Future<void> data (dynamic teams) async{
      setState(() {
        teamId = teams['_id'];
        teamName=teams['teamName'];
        domains = teams['domains'];
        leaderEmail= teams['leaderEmail'];
        teamCode=teams['teamCode'];
        // domainName= domains['name'];
        // print(domains![0]['tasks']!.length);
      });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      teams = widget.team;
      data(teams);
    });
    return Scaffold(
        // appBar:AppBar(title: Text("Team: $teamName",style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.w700 ),),
        //   backgroundColor: Color(0xFF250226),),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.6, 0.8),
              end: Alignment(0.4, 0.31),
              colors: [Color(0xFF150218), Color(0xFF65386C)],
            ),
          ),
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     begin:Alignment.topLeft,
          //     // Alignment(0.6, 0.8),
          //     end: Alignment.bottomRight,
          //     colors: [Color(0xFF9616AF),
          //       Color(0xFFB174BE)],
          //   ),
          // ),
          // color: Colors.purple.shade400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              SizedBox(height: 30,),
              Text("Team: $teamName",style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.w700 ),),
              SizedBox(height: 5,),
              Text("Leader: "+leaderEmail!.substring(0,leaderEmail!.indexOf('@')),
              style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.w700 ),),
              Text("Team Code: "+teamCode!,
                style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.w700 ),),

              SizedBox(height:10),


              // SizedBox(height: 10,),
              FutureBuilder<void>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color:Colors.white,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return  Expanded(
                      child: ListView.builder(
                          itemCount:domains!.length,
                          itemBuilder: (context,index) {
                            return ListTile(
                              title: Container(
                                width: MediaQuery.of(context).size.width/1.05,
                                // color: Colors.purpleAccent,
                                decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.1500),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),),
                                child: Column(
                                  children: [
                                    Text("Domain: "+domains![index]['name'],
                                        style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                    SizedBox(height:10),
                                    Text("Members: ",style: TextStyle(color: Colors.white)),
                                    ListView.builder(
                                      shrinkWrap: true,
                                        itemCount:domains![index]['members']!.length,
                                        itemBuilder: (context,index1) {
                                          return ListTile(
                                            title: Column(
                                                children: [
                                                  Text(domains![index]['members'][index1],
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 17
                                                  ),),
                                                  // SizedBox(height: 10,),
                                                ]),);}),
                                    SizedBox(height: 10,),
                                    Table(
                                      columnWidths: {
                                        0: FixedColumnWidth(60.0),
                                        1: FixedColumnWidth(80.0),
                                        2: FixedColumnWidth(85.0),
                                        3: FixedColumnWidth(80.0),
                                      },
                                      border: TableBorder(
                                          top: BorderSide(width: 2.0, color: Colors.white),
                                      left: BorderSide(width: 2.0, color: Colors.white),
                                      right: BorderSide(width: 2.0, color: Colors.white),
                                      bottom: BorderSide(width: 2.0, color: Colors.white)),
                                      children: [
                                        TableRow(
                                          children: [
                                            TableCell(
                                              child: Center(child: Text("Status",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))),
                                            ),
                                            TableCell(
                                              child: Center(child: Text('Member',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))),
                                            ),
                                            TableCell(
                                              child: Center(child: Text('Task',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))),
                                            ),
                                            TableCell(
                                              child: Center(child: Text('Deadline',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))),
                                            ),
                                          ],
                                        ),],),
                                        SizedBox(height: 10,),
                                    ListView.builder(
                                      shrinkWrap: true,
                                        itemCount:domains![index]['tasks']!.length,
                                        itemBuilder: (context,index2){
                                      return Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: ListTile(
                                            title:Table(
                                              columnWidths: {
                                                0: FixedColumnWidth(40.0),
                                                1: FixedColumnWidth(85.0),
                                                2: FixedColumnWidth(80.0),
                                                3: FixedColumnWidth(50.0),
                                              },
                                              // border: TableBorder.all(width: 5.0,color: Colors.transparent),
                                              // border: TableBorder.all(),
                                              children: [
                                                TableRow(
                                                    children: [
                                                      TableCell(
                                                        child: Center(child: Icon(
                                                          Icons.check_circle_outline,
                                                          color: domains![index]['tasks']![index2]!["completed"]==false?Colors.red:Colors.green,)),
                                                      ),
                                                      TableCell(
                                                        child: Center(child: Text(
                                                            domains![index]['tasks']![index2]!["assignedTo"].
                                                            substring(0,domains![index]['tasks']![index2]!["assignedTo"].indexOf('@')),
                                                        style: TextStyle(color: Colors.white),)),
                                                      ),
                                                      TableCell(
                                                        child: Center(
                                                            child: Text(domains![index]['tasks']![index2]!["description"],
                                                                style: TextStyle(color: Colors.white))),
                                                      ),
                                                      TableCell(
                                                        child: Center(
                                                            child: Text(domains![index]['tasks']![index2]!["deadline"],
                                                                style: TextStyle(color: Colors.white))),
                                                      ),
                                                    ]
                                                )
                                              ],
                                            )
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            );
                          },

                      ),
                    );
                  }
                },
              ),
                  // SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.05,
                    // color: Colors.purpleAccent,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.1500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),),
                    child: Column(
                      children: [

                        SizedBox(height: 10,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){
                              if(email==leaderEmail) {
                                Navigator.pushReplacementNamed(
                                    context, MyRoutes.DoneTask);
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Only leader can mark task as done"),),);

                              }// Navigator.push(context, MaterialPageRoute(builder: (context) => addTask(teamcode:teamCode)));
                            },
                              style:ElevatedButton.styleFrom(
                                // backgroundColor:Color.fromARGB(255, 225, 169, 229),
                                backgroundColor:Colors.purple.shade400,
                                // padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),

                              ),
                              child:Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Mark Task Done",style: TextStyle(color: Colors.white),),
                                  // SizedBox(width:5),
                                  // Icon(Icons.arrow_circle_right_outlined)
                                ],
                              ),),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: (){
                              if(email==leaderEmail) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) =>
                                        Resign(teamId: teamId)));
                                // Navigator.pushReplacementNamed(context, MyRoutes.DoneTask);
                              }else{
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) =>
                                        Mresign(teamId: teamId,emailId:leaderEmail)));
                              }
                              },
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.purple.shade400,
                              ),
                              child:Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Text(email==leaderEmail?"Remove":"Resign",style: TextStyle(color: Colors.white)),
                                  // SizedBox(width:5),
                                  // Icon(Icons.arrow_circle_right_outlined)
                                ],
                              ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){
                              if(email==leaderEmail) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addTask(teamcode:teamCode)));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Only leader can add task"),),);

                              }
                              },
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.purple.shade400,
                                // padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),

                              ),
                              child:Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Add Task",style: TextStyle(color: Colors.white)),
                                //   SizedBox(width:5),
                                // Icon(Icons.arrow_circle_right_outlined)
                                ],
                              ),),
                            SizedBox(width: 10,),
                            ElevatedButton(onPressed: (){


                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(leaderEmail!)));
                              // ek string h is page mei email usko call krlo bas

                            },
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.purple.shade400,
                                // padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),

                              ),
                              child:Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Text("Chat",style: TextStyle(color: Colors.white)),
                                  // SizedBox(width:5),
                                  // Icon(Icons.arrow_circle_right_outlined)
                                ],
                              ),),
                          SizedBox(width: 10,),
                              ElevatedButton(onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: builder( (context) => ResourceM ) ));
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => ResourceM(teamId!)));
                              },
                                style:ElevatedButton.styleFrom(
                                  backgroundColor:Colors.purple.shade400,
                                  // padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),

                                ),
                                child:Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Resources",style: TextStyle(color: Colors.white)),
                                    // SizedBox(width:5),
                                    // Icon(Icons.arrow_circle_right_outlined)
                                  ],
                                ),),
                          ],
                        ),
                      ],
                    ),
                  )
            ],
        ),
              ),
    );
  }
}
