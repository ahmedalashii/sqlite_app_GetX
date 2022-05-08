// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          Text(
            "Welcome Back ..",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 20),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email Address",
            ),
          ),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "/main_screen"),
            child: Text("LOGIN"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 45),
            ),
          ),
        ],
      ),
    );
  }
}
