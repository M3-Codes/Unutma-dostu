// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFc10080),
              Color(0xFF000000),
              Color(0xFF000000)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
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
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  )),
            ],
          ),
          SizedBox(
            width: 345,
            child: Column(
              children: [
                SizedBox(height: 320),
                TextFormField(
                  //keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10), //*** */
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF4F3145))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF4F3145))),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: _hpass,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 10), //*** */
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xFF4F3145))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xFF4F3145))),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: togglePassword()),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 97, 4, 66)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 144, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                  ),
                  child: Text(
                    " Login ",
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              Divider(thickness: 1, color: Color(0xFFc10080))),
                      Text(
                        " Or Login With ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFc10080)),
                      ),
                      Expanded(
                          child:
                              Divider(thickness: 1, color: Color(0xFFc10080))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 97, 4, 66)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 155, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                  ),
                  child: Image.asset("images/google.png", width: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Don't Have An Account ? ",
                          style: TextStyle(fontSize: 16)),
                      TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              color: Color(0xFFc10080),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ])),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 25,
              child: Image.asset(
                "images/yslogo.png",
                width: 250,
                height: 65,
              ))
        ],
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _hpass = !_hpass;
          });
        },
        icon: _hpass ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        color: Colors.grey);
  }
}
