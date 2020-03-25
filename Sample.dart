import 'package:learningapp/Models/StateReport.dart';
import 'package:learningapp/Services/states.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Countriespage1 extends StatefulWidget {
  @override
  _CountriespageState1 createState() => _CountriespageState1();
}

class _CountriespageState1 extends State<Countriespage1> {
  List<StateReport> reports, _filteredReports;
  String search;

  @override
  void initState() {
    super.initState();
    initialise();
  }

  initialise() async {
    List<StateReport> temp = await getStateReport();
    print("hello");
    print(temp);
    setState(() {
      reports = temp;
      _filteredReports = reports;
    });
    //print(reports);
  }

  @override
  Widget build(BuildContext context) {
    return reports != null
        ? Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Countries',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.blue,
                        border: OutlineInputBorder(),
                        labelText: "Search",
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _filteredReports = reports
                              .where((r) => (r.State
                              .toLowerCase()
                              .contains(text.trim().toLowerCase())))
                              .toList();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _filteredReports.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, '/countryReport', arguments: {
                          "countryReports" : _filteredReports[index],
                        });
                      },
                      leading: FaIcon(FontAwesomeIcons.globeAmericas),
                      title: Text(_filteredReports[index].State),
                      trailing: Icon(Icons.open_in_new, color: Color(0xFF1E3CFF),),
                    ),
                  );
                },
              ),
            )
          ],
        ))
        : Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
