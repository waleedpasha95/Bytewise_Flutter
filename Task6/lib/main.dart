import 'package:flutter/material.dart';
import './login_screen.dart';

 void main() => runApp(const loginUi());

 // ignore: camel_case_types
 class loginUi extends StatelessWidget {

  const loginUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Login UI",
      theme: ThemeData(
        primarySwatch: Colors.brown,

      ),

      home: Scaffold(
        
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Login Screen"
          ),
        ), 

        body: const LoginScreen(),


      ),

    
    );
  }



 }





