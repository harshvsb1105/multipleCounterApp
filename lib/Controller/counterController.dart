import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:multiple_counter_app/Model/counterModel.dart';

import '../BaseService.dart';
import '../ModelKeys.dart';
import '../main.dart';

class CounterController extends GetxController {
  BaseService baseService = BaseService();
  FirebaseFirestore db = FirebaseFirestore.instance;


  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  getData3() async {
    await db.collection("counterValues").doc("counter3").get().then((value) {
      counterModel =
          CounterModel(id: value["id"], countValue: value["countValue"]);
      count3.value = value["countValue"];
    });
  }

  getData2() async {
    await db.collection("counterValues").doc("counter2").get().then((value) {
      counterModel =
          CounterModel(id: value["id"], countValue: value["countValue"]);
      count2.value = value["countValue"];
    });
  }

  getData1() async {
    await db.collection("counterValues").doc("counter1").get().then((value) {
      counterModel =
          CounterModel(id: value["id"], countValue: value["countValue"]);
      count1.value = value["countValue"];
    });
  }

  @override
  void onInit() {
    super.onInit();
    getData1();
    getData2();
    getData3();
  }

  increment(String id, String index) async {
    if (index == "1") {
      count1++;
      await baseService.updateDocument(
          {CommonKeys.countValue: count1.toInt(), CommonKeys.id: index},
          id,
          db.collection("counterValues"));
    } else if (index == "2") {
      count2++;
      await baseService.updateDocument(
          {CommonKeys.countValue: count2.toInt(), CommonKeys.id: index},
          id,
          db.collection("counterValues"));
    } else if (index == "3") {
      count3++;
      await baseService.updateDocument(
          {CommonKeys.countValue: count3.toInt(), CommonKeys.id: index},
          id,
          db.collection("counterValues"));
    }
    update();
  }

  restore() async {
    count1 = 0.obs;
    count2 = 0.obs;
    count3 = 0.obs;
    await baseService.updateDocument(
        {CommonKeys.countValue: count1.toInt(), CommonKeys.id: '1'},
        "counter1",
        db.collection("counterValues"));
    await baseService.updateDocument(
        {CommonKeys.countValue: count2.toInt(), CommonKeys.id: '2'},
        "counter2",
        db.collection("counterValues"));
    await baseService.updateDocument(
        {CommonKeys.countValue: count3.toInt(), CommonKeys.id: '3'},
        "counter3",
        db.collection("counterValues"));
    update();
  }

}
