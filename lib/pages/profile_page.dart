// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/activity.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:jogo_mobile_app/pages/ranking_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  List<Activity> activities = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(user?.photo ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user?.name ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Category: ${user!.category}',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          user?.events.toString() ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'Events',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF525E7B),
                            height: 1.4,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), 
                    Column(
                      children: [
                        Text(
                          user?.points.toString() ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'Points',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF525E7B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text(
                          'My Points',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {
                            AutoRouter.of(context).push(RankingRoute());
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        height: 200,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  minimum: 0,
                                  maximum: 500,
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 150,
                                  endAngle: 30,
                                  radiusFactor: 0.8,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 20,
                                    color: const Color.fromARGB(255, 147, 229, 150),
                                    thicknessUnit: GaugeSizeUnit.logicalPixel,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: user!.points?.toDouble() ?? 0.0,
                                      width: 20,
                                      color: Colors.green,
                                      pointerOffset: 10,
                                      enableAnimation: true,
                                      animationDuration: 1000,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned.fill(
                              child: FractionallySizedBox(
                                alignment: Alignment.center,
                                widthFactor: 0.4,
                                heightFactor: 0.4,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Progreso',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '${user!.points}/500',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      Activity activity = activities[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(activity.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text(
                                        activity.name!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "+" +
                                            activity.points!.toString() +
                                            " pts",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: 3),
                                    Text(
                                      activity.date!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> getProfile(BuildContext context) async {
    try {
      Response response = await UserService().getUserProfileData(context);
      dynamic res = response.data;
      print(res);
      if (res['ErrorCode'] == null && res["success"] != "") {
        user = User.fromJson(res['profile']);
        activities.clear();
        res['activity'].forEach((value) {
          activities.add(Activity.fromJson(value));
        });
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${res['message']}'),
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      print(error.toString());
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An error occurred.'),
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
