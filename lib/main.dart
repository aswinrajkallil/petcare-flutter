import 'package:flutter/material.dart';
import 'package:petcareapp/community.dart';
import 'package:petcareapp/doctordetails.dart';
import 'package:petcareapp/guide.dart';
import 'package:petcareapp/homescreen.dart';
import 'package:petcareapp/login.dart';
import 'package:petcareapp/orderhistory.dart';
import 'package:petcareapp/petdetails.dart';
import 'package:petcareapp/petprofile.dart';
import 'package:petcareapp/profilemanagement.dart';
import 'package:petcareapp/purchaseproduct.dart';
import 'package:petcareapp/register.dart';
import 'package:petcareapp/sellerregister.dart';
import 'package:petcareapp/viewShop.dart';
import 'package:petcareapp/viewpets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:HomePage(),
      
    );
  }
}
