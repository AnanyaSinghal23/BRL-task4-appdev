// app dev starts here
// only push here in dev branch 
// do not merge in main branch

import 'package:brl_task4/screens/dashboard.dart';
import 'package:brl_task4/screens/join_team.dart';
import 'package:brl_task4/screens/signup.dart';
import 'package:brl_task4/screens/login.dart';
import 'package:brl_task4/screens/teamDetail.dart';
import 'package:brl_task4/utils/Routes.dart';
import'package:flutter/material.dart';
import 'home_page/bottomnavbar.dart';
import 'home_page/home_page_home.dart';
import 'home_page/teams.dart';
import 'home_page/tasks.dart';
import 'package:brl_task4/home_page/progress.dart';
import 'package:brl_task4/home_page/todo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: TodoList(),
        initialRoute: '/',
        routes: {
          // '/':(context)=>dashb_mem(),
        '/': (context) =>SignUp(),
        MyRoutes.SignUpRoutes: (context) => SignUp(),
        MyRoutes.LoginRoutes: (context) => Login(),
        MyRoutes.dashbMemRoutes: (context) => dashb_mem(),
        MyRoutes.jointeamRoutes: (context) => join_team(),
        MyRoutes.tdetailRoutes: (context) => t_detail(),
          }
        );
  }
}
