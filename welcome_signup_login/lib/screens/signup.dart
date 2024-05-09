// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _hpass = false;
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
                      borderRadius: BorderRadius.circular(24)),
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
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23))),
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
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF4F3145))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF4F3145))),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 97, 4, 66)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 140, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Already Have An Account ? ",
                          style: TextStyle(fontSize: 16)),
                      TextSpan(
                          text: "Login",
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
        icon: _hpass ? Icon(Icons.visibility_off) : Icon(Icons.visibility));
  }
}
