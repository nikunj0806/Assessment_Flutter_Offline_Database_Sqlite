import 'package:flutter/material.dart';
import 'package:practicdatabase/Screen/AddAdminScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAdminScreen(),
    );
  }
}