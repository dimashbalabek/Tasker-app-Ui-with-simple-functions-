import 'package:dimash_balabek_lvl4/HomePage.dart';
import 'package:dimash_balabek_lvl4/data.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  final _age = TextEditingController();
  final _name = TextEditingController();
  final _gender = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phone = TextEditingController();
  List genderList = ["Male", "Female"];
  bool isMale = true;
  String gender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text("Registration"),
                    Image.asset("assets/profile.png", width: 100,)
                  ],
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.name,
                controller: _name,
                validator: (_name) {
                  if (_name == null || _name.isEmpty) {
                    return "please enter your name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  )
                ),
              ),
              Text("Example Dimash Balabek"),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: _age,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your Age";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Age",
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  )
                ),
              ),


              DropdownButton(
                icon: isMale?  Icon(Icons.male) : Icon(Icons.female),
                value: gender,
                items: [
                  DropdownMenuItem<String>(child: Text(genderList[0]), value: genderList[0],),
                  DropdownMenuItem<String>(child: Text(genderList[1]), value: genderList[1],),
                ], 
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue == genderList[1]) {
                      isMale = false;
                    }else{isMale = true;}
                    gender = newValue!;
                  });
                },
                ),

                SizedBox(height: 10,),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  )
                ),
              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: _password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your Phone number";
                  }
                  else if(value.length < 11 || value.length >11){
                    return "please enter your Phone number right";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Phone-Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  )
                ),
              ),

              SizedBox(height: 10,),


                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50))
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      usersData.add(User(name: _name.text, gender: gender, age: _age.text, email: _email.text, password: _password.text));
                      print(usersData[2].age);
                      _formKey.currentState!.dispose();
                      Navigator.pushReplacement(context, MaterialPageRoute<void>( builder: (BuildContext context) =>  HomePage(),),);
                      
                    }
                  },
                 child: Text("Register")
                )
            ],
          )
          ),
      ),
    );
  }
}