import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FreeTrialScreen extends StatefulWidget {
  @override
  _FreeTrialScreenState createState() => _FreeTrialScreenState();
}

class _FreeTrialScreenState extends State<FreeTrialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.blue),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 310,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  "Start A Free Trial Now",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: ListView(
              children: [
                TimelineTile(
                  isFirst: true,
                  beforeLineStyle: LineStyle(color: Colors.black),
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    color: Colors.transparent,
                    indicator: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                          Icon(Icons.lock_clock_outlined, color: Colors.white),
                    ),
                  ),
                  endChild: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today"),
                        Text("Unlock all the features"),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  beforeLineStyle: LineStyle(color: Colors.black),
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    color: Colors.black,
                    indicator: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                    ),
                  ),
                  endChild: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Day 4"),
                        Text("Get Reminder that your trial is about to end"),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  isLast: true,
                  beforeLineStyle: LineStyle(color: Colors.black),
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    color: Colors.transparent,
                    indicator: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.timer_outlined, color: Colors.white),
                    ),
                  ),
                  endChild: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Day 7"),
                        Text("If you want you can cancel any time"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text("7 Days Free Trail, Then ₹99/month "),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {}, child: Text("Start 7-Day Free Trail")),
          TextButton(onPressed: () {}, child: Text("View All Plans"))
        ],
      ),
    );
  }
}
