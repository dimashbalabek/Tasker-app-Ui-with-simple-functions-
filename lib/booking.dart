import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List _address = [];
  List searchList = [];
  String dropDownValue = "all";
  bool showAll = true;
  @override
  void initState() {
    super.initState();
    readjson();
  }

  Future<void> readjson() async{
    final  response = await rootBundle.loadString("assets/address.json");
    final data = await json.decode(response);

    setState(() {
      _address = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
        icon: Icon(Icons.arrow_back)
        ),
        title: Text("Setup Address"),

      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 100,
              color: Colors.amber,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Where does the task start from?"),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: TextField(
                          onChanged: (value) {
                            
                          List fileteredList1 = [];
                          for (var i = 0; i < _address.length; i++) {
                            String check = _address[i]["address"];
                            if (check.toLowerCase().split(" ").join("").contains(value.toLowerCase().split(" ").join()) && dropDownValue == _address[i]["city"]) {
                              fileteredList1.add(_address[i]);
                              print(_address[i]["address"]);
                            }
                          }
                          setState(() {
                            searchList = fileteredList1;
                            print("UwU");
                          });
                          
                        
                          },
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                        ),
                      ),
            
                      DropdownButton(
                        value: dropDownValue,
                        hint: Text("City"),
                        items: [
                          DropdownMenuItem<String>(child: Text("New York"), value: "New York",),
                          DropdownMenuItem<String>(child: Text("Los Angeles"), value: "Los Angeles",),
                          DropdownMenuItem<String>(child: Text("Chicago"), value: "Chicago",),
                          DropdownMenuItem<String>(child: Text("All Cities"), value: "all",),
                          
                        ], 
                      onChanged: (String? newValue){
                        searchList = [];
                        List filteredList = [];
                        for (var i = 0; i < _address.length; i++) {
                          var check = _address[i]["city"];
                          if (check == newValue) {
                            filteredList.add(_address[i]);
                          }
                        }
            
                        if (newValue == "all") {
                          showAll = true;
                        }else{showAll = false;}
            
                        setState(() {
                          searchList = filteredList;
                          dropDownValue = newValue!;
                        });
                      }
                      )
            
                    ],
                  ),
            
                ],
              ),
            ),
          ),
                Expanded(
                  child:
                 ListView.builder(
                    itemCount: showAll? _address.length : searchList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(showAll? _address[index]["address"] : searchList[index]["address"]),
                          Text(showAll? _address[index]["city"] : searchList[index]["city"]),
                        ],
                      );
                    },
                    ),

                  )
        ],
      ),
    );
  }
}