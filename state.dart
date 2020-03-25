import 'dart:convert';

import 'package:beautifulsoup/beautifulsoup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:html/parser.dart';



class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1>
    with SingleTickerProviderStateMixin {

  List<String> list = List();
  var isLoading = false;

  AnimationController _controller;


  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get("https://webcache.googleusercontent.com/search?q=cache:https://mohfw.gov.in/");
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var soup = Beautifulsoup(response.body);
      print(soup("table").text);
      String parsedString = parse(document.body.text).documentElement.text;

      var priceElement = document.getElementsByClassName("content newtab");
// list = priceElement.toList();
      list=soup("div").outerHtml as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }


  @override
  void initState() {
    super.initState();
    _fetchData();
    print(list);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),

        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: new Text(list.toString()),

              );
            }));
  }

}