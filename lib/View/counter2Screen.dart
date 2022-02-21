import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_counter_app/Constants.dart';
import 'package:multiple_counter_app/Controller/counterController.dart';


class Counter2Screen extends StatelessWidget {
  final String? index;

  const Counter2Screen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.brown1,
        title: Text("Counter $index"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.restore(),
              icon: Icon(Icons.settings_backup_restore))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Value of count on screen 2",style: TextStyle(color: AppColors.textColor,)),
            GetBuilder<CounterController>(
              builder: (controller) => Text(
                "${controller.count2}",
                style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown2),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.brown1)),
                onPressed: () => controller.increment("counter2", "2"),
                child: Text("Increment Me!"))
          ],
        ),
      ),
    );
  }
}
