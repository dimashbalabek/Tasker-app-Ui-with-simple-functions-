import 'dart:convert';

import 'package:dimash_balabek_lvl4/TaskerProfile.dart';
import 'package:dimash_balabek_lvl4/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  List _tasks = [];
  List _people = [];
  List searchList = [];
  @override
  void initState() {
    readjson1();
    readjson2();
    super.initState();
  }

    Future<void> readjson1() async{
      final  response = await  rootBundle.loadString("assets/tasks.json");
      final data = await json.decode(response);

      setState(() {
        _tasks = data;
      });
    }

  Future<void> readjson2() async{
    final  response = await  rootBundle.loadString("assets/people.json");
    final data = await json.decode(response);

    setState(() {
      _people = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container( // THE MAIN PAGE
          height: isSearch? null: MediaQuery.of(context).size.height*0.3,
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              isSearch?
              SizedBox()
              :
              Row( // first row with logo and icon buttons
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/Logo.png", width: 40,),
                  Row(children: [IconButton(onPressed: (){}, icon: Icon(Icons.message)), IconButton(onPressed: (){}, icon: Icon(Icons.notification_important_rounded))],)
                ],
              ),

              isSearch?
              SizedBox()
              :
              Row( // second row with text container and Profile Image
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [Text("Good morning!"), Text("Ashley Robinson")],),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){ return TaskerProfile();}));
                    },
                    child: Image.asset("assets/profile.png", width: 60,)
                    )
                ],
              ),

              
              SizedBox(height: 20,),

              TextField(
                onChanged: (value) {
                        List fileteredList = [];
                        for (var i = 0; i < _tasks.length; i++) {
                          
                          String check = _tasks[i]["title"];
                          if (check.toLowerCase().split(" ").join("").contains(value.toLowerCase().split(" ").join())) {
                            fileteredList.add(_tasks[i]);
                          }
                        }
                        setState(() {
                          searchList = fileteredList;
                        });
                        
                      
                },
                onTap: () {

                  setState(() {
                    isSearch = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Search Tasks",
                  prefixIcon: isSearch? IconButton(onPressed: (){setState(() {isSearch = false;});}, icon: Icon(Icons.arrow_back)) :Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                ),
              )
            ],
          ),
          ),

          Expanded(
            child: 
            isSearch?
            ListView( // List of search
              children: [
                ...List.generate(searchList.length, (int index){ 
                  return GestureDetector(
                    onTap: () {
                      Navigator.push<void>(context, MaterialPageRoute<void>( builder: (BuildContext context) => const Booking(), ));
                    },
                    child: Container(
                      
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        children: [
                          Image.asset(searchList[index]["image"], width: 80,),
                          Text(searchList[index]["title"])
                        ],
                      ),
                      ),
                  );
                })
              ],
            )
            :
            Padding(
              padding: EdgeInsets.all(12),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _PopContainer(0, _tasks, context),
                            _PopContainer(1, _tasks, context),
                          ],
                        ),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _PopContainer(2, _tasks, context),
                            _PopContainer(3, _tasks, context),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(width: MediaQuery.of(context).size.width*0.7,child: Text("Find a Tasker at extremely perfectional prices")),

                  ClipRRect(
                    child: Stack(children: [Image.asset("assets/photo5.png")],),
                  ),

              
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Top Tasker"),
                        Text("Experts lead you through topics.")
                      ],
                    ),
                  ),

                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _people.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.black12,
                          width: 140,
                          height: 200,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset("assets/profile.png"),
                                Text(_people[index]["name"]),
                                Text(_people[index]["specialty"]),
                              ],
                            ),
                          ),
                        );
                      },
                      ),
                  )
              
                  
                ],
              ),
            )
            )
        ],
      ),
    );
  }
}

Widget _PopContainer(int int, List data, context){
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width* 0.4,
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(data[int]["title"]),
        Image.asset("assets/profile.png", width: 100,)

      ],
    ),
  );
}