import 'dart:convert';

import 'package:learningapp/Models/Andhra.dart';
import 'package:learningapp/Models/StateReport.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:learningapp/Models/StateWise.dart';

final String link = "http://indiacovid-api.herokuapp.com/total";
//final String link="https://corona.lmao.ninja/countries";

//Future<StateReport> getReport() async {
//  StateReport report;
//  DateFormat formatter = DateFormat("MMM d y");
//  DateFormat timeFormatter = DateFormat().add_jm();
//
//  try {
//    Response response = await get(link + "all");
//    Map data = jsonDecode(response.body);
//    report = new StateReport(
//      deaths: data["deaths"],
//      Discharged: data["Discharged"],
//      ForeignNational: data["ForeignNational"],
//      IndianNational: data["IndianNational"],
//
//      State: data["State"],
//     // confirmed: data['cases'] - (data['deaths'] + data['recovered']),
////      updatedDate: formatter
////          .format(DateTime.fromMillisecondsSinceEpoch(data['updated'])),
////      updatedTime: timeFormatter
////          .format(DateTime.fromMillisecondsSinceEpoch(data['updated'])),
//    );
//    print(data);
//  } catch (e) {
//    print("Exception Caught at getReport() $e");
//  }
//
//  return report;
//}

Future<List<StateReport>> getStateReport() async {

  List<StateReport> reports = [];
  List<StateWise> data, sample, _dat1;

  var jsondata;
  Andhra d;
  try {
    Response response = await get("http://indiacovid-api.herokuapp.com/total");
    print(response.body);
     //data=response.body;
    //final response = await http.get(s);
    jsondata = json.decode(response.body);
    d = Andhra.fromJson(jsondata);
    data = d.stateWise;
//    setState(() {
//      sample = test;
//      _dat1 = sample;
//    });

    //List data = jsonDecode(response.body);
    print("hello0");
    print(data);
   // for (int i = 0; i < data.length; i++) {
     // StateReport _report = new StateReport(
//        deaths: data[i]["Deaths"],
//        Discharged: data[i]["Discharged"],
//        ForeignNational: data[i]["ForeignNational"],
//        IndianNational: data[i]["IndianNational"],
//
//        State: data[i]["State"],
        // confirmed: data['cases'] - (data['deaths'] + data['recovered']),
//      updatedDate: formatter
//          .format(DateTime.fromMillisecondsSinceEpoch(data['updated'])),
//      updatedTime: timeFormatter
//          .format(DateTime.fromMillisecondsSinceEpoch(data['updated'])),
   //   );
     // reports.add(_report);
    }

   // print(data.length);
   catch (e) {
    print("Exception Caught at getCountriesReport() $e");
  }

  return reports;
}
/*
Future<CountryHistory> getCountryHistoryReport(String countryName) async {
  try {
    Response response = await get(link + "historical/" + countryName);
    dynamic data = jsonDecode(response.body);

    Map<String, dynamic> cases = data["timeline"]["cases"];
    Map<String, dynamic> deaths = data["timeline"]["deaths"];
    Map<String, dynamic> recovered = data["timeline"]["recovered"];

    return new CountryHistory(
      cases: cases.map(_mapHistoryRecord),
      deaths: deaths.map(_mapHistoryRecord),
      recovered: recovered.map(_mapHistoryRecord),
    );
  } catch (e) {
    return new CountryHistory(cases: {}, deaths: {}, recovered: {});
  }
}

final DateFormat format = new DateFormat("MM/dd/yy");

MapEntry<DateTime, int> _mapHistoryRecord(String dateString, dynamic count) {
  return MapEntry<DateTime, int>(format.parse(dateString), count.toInt());
}
*/