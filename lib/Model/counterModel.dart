
import '../ModelKeys.dart';

class CounterModel {
  String ?id;
  int ?countValue;

  CounterModel({
    this.id,
    this.countValue,
  });

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(
      id: json[CommonKeys.id],
      countValue: json[CommonKeys.countValue],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[CommonKeys.id] = this.id;
    data[CommonKeys.countValue] = this.countValue;
    return data;
  }
}
