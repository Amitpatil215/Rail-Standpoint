import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_mock/Controller/live_train_info_controller.dart';

class TrainDateCard extends StatelessWidget {
  // Injecting instance in a memory
  final _liveTrainInfoController = Get.put(LiveTrainInfoController());
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () {
                  return Text(
                    'Train No: ${_liveTrainInfoController.liveTrainInfo.value.trainNumber}',
                    style: TextStyle(fontSize: 22),
                  );
                },
              ),
              Obx(() {
                return Text(
                  'Date: ${_liveTrainInfoController.liveTrainInfo.value.startDate}',
                  style: TextStyle(fontSize: 22),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
