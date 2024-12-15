// ignore_for_file: sized_box_for_whitespace

import 'package:dimash_balabek_lvl4/HomePage.dart';
import 'package:dimash_balabek_lvl4/RegisterPage.dart';
import 'package:dimash_balabek_lvl4/data.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  bool isEmail = false; 
  bool isPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/Logo.png", width: 70,),
          
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    Text("Welcome!", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),),
                    Text("Hi! enter your details to get sign in to your account"),
                  ],
                ),
              ),
          
              TextFormField(
                controller: _emailC,
                validator: (value) {

                  for (var i = 0; i < usersData.length; i++) {
                    if (usersData[i].email == value) {
                      isEmail = true;
                      break;
                    }
                  }

                  if (value == null || value.isEmpty) {
                    return "Please enter your email at first";
                  }
                  else if(isEmail == false){
                    return "invalid email";
                  }
                  
                },
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,))
                ),
              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: _passC,
                validator: (value) {

                  for (var i = 0; i < usersData.length; i++) {
                    if (usersData[i].password == value) {
                      isPass = true;
                      break;
                    }
                  }

                  if (value == null || value.isEmpty) {
                    return "Please enter your password at first";
                  }
                  else if(isPass == false){
                    return "invalid password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,))
                ),
              ),

              TextButton(onPressed: (){}, child: Text("Forgot Password?")),

              SizedBox(height: 80,),

              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50))
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Future.delayed(Duration(seconds: 2), (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){ return HomePage();}));});
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Succesfully logged in!")));
                    _formKey.currentState!.reset();
                  }
              }, child: Text("Login")
              ),

              SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50))),
                onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){ return RegisterPage();}));
              }, child: Text("Register")),

              SizedBox(height: 30,),

              Text("or Sign in via"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 227, 227, 227),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Icon(Icons.apple),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 227, 227, 227),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Icon(Icons.apple),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 227, 227, 227),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Icon(Icons.apple),
                  ),
                ],
              )
            ],
          ),
        ),
        ),
    );
  }
}