import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'Próximos eventos',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: Image.asset('assets/images/prueba.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
