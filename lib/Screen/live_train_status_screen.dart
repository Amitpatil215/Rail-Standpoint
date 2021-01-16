import 'package:flutter/material.dart';
import 'package:rail_mock/Screen/Widget/info_form.dart';
import 'package:rail_mock/Screen/Widget/live_station.dart';
import 'Widget/route_list.dart';
import 'Widget/train_date_card.dart';

class LiveTrainStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Rail Standpoint',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.purple,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormInfo(),
            SizedBox(height: 10),
            TrainDateCard(),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.signal_cellular_alt),
                SizedBox(width: 5),
                Text(
                  'Live Station',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            LiveStation(),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.train),
                SizedBox(width: 5),
                Text(
                  'Route',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: RouteList()),
          ],
        ),
      ),
    );
  }
}
