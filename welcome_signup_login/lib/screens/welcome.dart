// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFc10080), Color(0xFF000000)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Flexible(
              flex: 8,
              child: Container(
                height: 240,
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Welcome Back!\n',
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text:
                              '\nEnter personal details to your employee account',
                          style: TextStyle(
                            fontSize: 20,
                            // height: 0,
                          ))
                    ],
                  ),
                ),
              )),
          Positioned(
              top: 70,
              child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(
                    "images/Logo.png",
                  ))),
          Column(
            children: [
              SizedBox(
                height: 520,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 132, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                ),
                child: Text(
                  " Login ",
                  style: TextStyle(fontSize: 20, color: Colors.grey[850]),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 130, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                ),
                child: Text(
                  "SignUp",
                  style: TextStyle(fontSize: 20, color: Colors.grey[850]),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 25,
              child: Image.asset(
                "images/ylogo.png",
                width: 250,
                height: 65,
              ))
        ],
      ),
    );
  }
}
