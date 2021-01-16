import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rail_mock/Controller/live_train_info_controller.dart';

// ignore: must_be_immutable
class FormInfo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void onSearchPressed() async {
    if (pickedDate == null && trainNo == null) {
      Get.snackbar(
        "Error",
        "Please Provide Valid Date & Train No",
        colorText: Colors.red,
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    _formKey.currentState?.save();
    final _formatedDate = DateFormat('yyyMMDD').format(pickedDate);
    print(trainNo);
    print(pickedDate);
    print(DateFormat('yyyMMDD').format(pickedDate));
    await Get.find<LiveTrainInfoController>()
        .getLiveStatusFromAPi(trainNo, _formatedDate);
  }

  String trainNo = '';
  DateTime pickedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Train No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onSaved: (val) {
                  if (val != null) {
                    trainNo = val;
                  }
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                var _pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 3)),
                  lastDate: DateTime.now().add(Duration(days: 4)),
                );
                pickedDate = _pickedDate;
              },
            ),
            Text('Selected Date'),
            Spacer(),
            RaisedButton.icon(
              elevation: 10,
              icon: Icon(Icons.search),
              label: Text('Search'),
              onPressed: () {
                onSearchPressed();
              },
            ),
          ],
        ),
      ],
    );
  }
}
