import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_counter_app/Constants.dart';
import 'Controller/counterController.dart';
import 'Model/counterModel.dart';
import 'View/Counter3Screen.dart';
import 'View/counter1Screen.dart';
import 'View/counter2Screen.dart';

CounterModel counterModel = CounterModel();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return Counter1Screen(
        index: (this.selectedIndex + 1).toString(),
      );
    } else if (this.selectedIndex == 1) {
      return Counter2Screen(index: (this.selectedIndex + 1).toString());
    } else {
      return Counter3Screen(index: (this.selectedIndex + 1).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    CounterController _controller = Get.put(CounterController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff603601),
          onPressed: () {
            if (this.selectedIndex == 0) {
              return _controller.increment("counter1", "1");
            } else if (this.selectedIndex == 1) {
              return _controller.increment("counter2", "2");
            } else if (this.selectedIndex == 2) {
              return _controller.increment("counter3", "3");
            }
            setState(() {});
          },
          child: Icon(Icons.add, color: Color(0xffCC9544),),
        ),
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          backgroundColor: Color(0xff603601),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm_outlined,
                color: Colors.deepPurpleAccent,
              ),
              label: 'Counter 1',
              backgroundColor: AppColors.brown2
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm_outlined,
                color: Colors.deepOrangeAccent,
              ),
              label: 'Counter 2',
                backgroundColor: AppColors.brown2

            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm_outlined,
                color: Colors.blueAccent,
              ),
              label: 'Counter 3',
                backgroundColor: AppColors.brown2

            ),
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ),
      ),
    );
  }
}
