import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskerProfile extends StatefulWidget {
  const TaskerProfile({super.key});

  @override
  State<TaskerProfile> createState() => _TaskerProfileState();
}

class _TaskerProfileState extends State<TaskerProfile> {

  Map<String, dynamic> _ratings = {};
  List reviewSum = [32, 8, 1, 1, 0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readjson1();
  }

  Future<void> readjson1() async{
    final  response = await  rootBundle.loadString("assets/ratings.json");
    final data = await json.decode(response);

    setState(() {
      _ratings = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)
          ),
          title: Text("Tasker Profile"),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined))],
      ),

      body: Column(
        children: [
          Container( // MAAAAAIN
          padding: EdgeInsets.all(12),
          color: Colors.white,
          height: MediaQuery.of(context).size.width*0.50,
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Row( // row with photo
                    children: [
                      Container(color: Colors.white,margin: EdgeInsets.only(right: 10),child: ClipRRect(child: Image.asset("assets/profile.png", width: 100, fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10),)),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 223, 255),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Text("Elite Tasker", style: TextStyle(color: Colors.purple),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 215, 229),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star_outline, color: Colors.pink,),
                                      Text("5.0(42 reviews)", style: TextStyle(color: Colors.pink),),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),

                            Text("Ashley Robinson", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10,),

                Text("Working as driver demands a set of vital skills and experiences to gurantee both safely and efficiently in transportation "),

                SizedBox(height: 10,),

                Row( //  Icons.local_shipping    Icons.edit  
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: 70,
                      child: Column(
                        children: [
                          Icon(Icons.check_circle_outline),
                          Text("Overall jobs")

                        ],
                      ),
                    ),
                     Container(height: 70, color: Color.fromARGB(150, 157, 157, 157),width: 2,),

                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: 70,
                      child: Column(
                        children: [
                          Icon(Icons.local_shipping_outlined),
                          Text("Overall jobs")

                        ],
                      ),
                    ),

                     Container(height: 70, color: Color.fromARGB(150, 157, 157, 157),width: 2,),


                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: 70,
                      child: Column(
                        children: [
                          Icon(Icons.edit_outlined),
                          Text("Overall jobs")

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Reviews", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),),

                              Container(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 12),
                                      width: 220,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white
                                      ),

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [...List.generate(5-index, (index){return Icon(Icons.star, color: Colors.pink,);})],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("${reviewSum[index]} reviews")
                                        ],
                                      ),
                                    );
                                  },
                                  ),
                              )
                    
                            ],
                          ),
                        ),

                        SizedBox(height: 16,),

                        ...List.generate(_ratings["ratings"]["5stars"]["reviews"].length, (int index){
                          return Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(bottom: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                            ),

                            width: MediaQuery.of(context).size.width*0.8,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row( //person data
                                  children: [
                                    Container(
                                      child: Row( // THE PERSOn
                                        children: [
                                          ClipRRect(child: Image.asset("assets/photo6.png", width: 50,), borderRadius: BorderRadius.circular(90),),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(_ratings["ratings"]["5stars"]["reviews"][index]["name"]),
                                              Row(children: [...List.generate(5, (index){return Icon(Icons.star, color: Colors.pink,);})],),
                                              Container(height: 40,width: MediaQuery.of(context).size.width*0.7,child: Text(_ratings["ratings"]["5stars"]["reviews"][index]["review"]))//review
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  )
                  )

        ],
      ),
    );
  }
}