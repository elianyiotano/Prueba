// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:jogo_mobile_app/pages/ranking_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
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
                image: const DecorationImage(
                  image: AssetImage('assets/images/my_profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Viviana Morales',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Category: Silver',
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
                    '195',
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
              SizedBox(width: 20), // Espacio entre los bloques
              Column(
                children: [
                  Text(
                    '15',
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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                      final router = context.router;
                      router.pushNamed('/ranking');
                    },
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            startAngle: 150,
                            endAngle: 30,
                            radiusFactor: 0.8,
                            axisLineStyle: AxisLineStyle(
                              thickness: 20,
                              color: Colors.grey[300],
                              thicknessUnit: GaugeSizeUnit.logicalPixel,
                            ),
                            pointers: const <GaugePointer>[
                              RangePointer(
                                value: 75,
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
                            child: const Column(
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
                                  '195/500',
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
                'Recently activity',
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/my_profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Activity Title',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Activity Description',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '+10',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
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
}
