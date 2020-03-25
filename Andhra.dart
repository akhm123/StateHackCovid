import 'StateWise.dart';

class Andhra {
  List<StateWise> stateWise;

  Andhra({this.stateWise});

  Andhra.fromJson(Map<String, dynamic> json) {
    if (json['StateWise'] != null) {
      stateWise = new List<StateWise>();
      json['StateWise'].forEach((v) {
        stateWise.add(new StateWise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stateWise != null) {
      data['StateWise'] = this.stateWise.map((v) => v.toJson()).toList();
    }
    return data;
  }
}