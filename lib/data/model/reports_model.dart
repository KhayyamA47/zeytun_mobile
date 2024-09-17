import 'package:zeytun_app/data/model/data_model.dart';

class ReportsModel {
  DataModel? data;

  ReportsModel({this.data});

  ReportsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ReportsModel{data: $data}';
  }
}
