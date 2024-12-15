import 'package:dimash_balabek_lvl4/HomePage.dart';
import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(child: Image.asset("assets/photo6.png", width: 120,), borderRadius: BorderRadius.circular(90),),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Comment", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),),
                  Container(
                    
                    color: Colors.white,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline  ,
                          decoration: InputDecoration(
                            
                            filled: true,
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "The comment should not be empty ";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                
                style: ButtonStyle(
                  
                  minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50))
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text("comment is successfully added!"))
                    // );
                    showDialog(context: context, builder: (context) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          color: Color.fromARGB(53, 255, 254, 254),
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle_outline, size: 40,),
                              Text("Successfully added comment", style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width*0.8, 50))
                                ),
                                onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){ return HomePage();}));
                              }, child: Text("Back to Home"))
                              
                            ],
                          ),
                        ),
                      );
                    },);
                    _formKey.currentState!.reset();
                  }
                }, 
                child: Text("Send")
                )
            ],
          ),
        ),
      ),
    );
  }
}